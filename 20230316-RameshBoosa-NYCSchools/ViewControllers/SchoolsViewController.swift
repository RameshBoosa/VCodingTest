//
//  SchoolsViewController.swift
//  VCodingTest
//
//  Created by Ramesh Boosa on 3/16/23.
//

import UIKit
import Combine


class SchoolsViewController: UIViewController, StoryboardDelegate {
    
    weak var coordinator: MainCoordinator?
    
    lazy var viewModel: SchoolsViewModel = {
        let viewModel = SchoolsViewModel()
        return viewModel
    }()
    
    var schoolsDataSource: Schools = []
    var resultsDataSource: Results = []

    let cellIdentifier = "cell"
    
    var schoolsCancellable: AnyCancellable?
    var resultsCancellable: AnyCancellable?


    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var tableview: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Common init for tableview
        initTableView()
        
        /// Fetch basic feed to map with UI
        ///
        // In-terms of performance it can be improved by seperating fetchschools() and fetchresult calls which we are calling as part of fetchData since there is no dependency with results in home page
        viewModel.fetchData()
        
        // Trigger bindViewModel when landed on this screen, since it observes publishers it keeps re-renders the ui whenever publisher is updated
        bindViewModel()
    }
    
    fileprivate func initTableView() {
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 100
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    ///  Reload Table
    fileprivate func reloadSchools() {
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    
    private func bindViewModel() {
        loader.startAnimating()
        
        /// Schools Publisher should observe the latest updates to re-render the UI
        schoolsCancellable = viewModel.$schools.sink(receiveValue: { (response) in
            DispatchQueue.main.async {
                [weak self] in
                guard let weakSelf = self else { return }
                weakSelf.schoolsDataSource = response
               
                weakSelf.reloadSchools()
                weakSelf.loader.stopAnimating()
            }
        })
        
        /// Results Publisher should observe the latest updates
        resultsCancellable = viewModel.$results.sink(receiveValue: { (response) in
            DispatchQueue.main.async {
                [weak self] in
                guard let weakSelf = self else { return }
                weakSelf.resultsDataSource = response
                weakSelf.loader.stopAnimating()
            }
        })
    }
}

// MARK: UITableViewDataSource

extension SchoolsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let school = schoolsDataSource[indexPath.row]
        
        if let name = school.schoolName, let locatioName = school.location {
            cell.textLabel?.text = name
            cell.detailTextLabel?.text = locatioName.components(separatedBy: "(").first
            
            cell.textLabel?.font = UIFont(name: "Avenir-Light", size: 18)
            cell.detailTextLabel?.textColor = .blue
        }
        
        return cell
    }
}

// MARK: UITableViewDelegate

extension SchoolsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let school = schoolsDataSource[indexPath.row]
        coordinator?.school = school
        guard let dbn = school.dbn else { return }
        
        /// find the index of maching SAT result with dbn unique key
        if let resultIndex = resultsDataSource.firstIndex(where: { $0.dbn == dbn }) {
            coordinator?.result = resultsDataSource[resultIndex]
        } else {
            coordinator?.result = nil
        }
        coordinator?.showDetailVC()
    }
}
