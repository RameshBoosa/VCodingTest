//
//  SchoolDetailTableViewController.swift
//  VCodingTest
//
//  Created by Ramesh Boosa on 3/16/23.
//

import UIKit
import Combine

class SchoolDetailTableViewController: UITableViewController, StoryboardDelegate {
    
    weak var coordinator: MainCoordinator?

    var school: School?
    var result: SATResult?

    var dataSource: Results = []
    var cancellable: AnyCancellable?
    
    let defaultValue = "N/A"
        
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    @IBOutlet weak var location: UIButton!
    @IBOutlet weak var phone: UIButton!
    @IBOutlet weak var website: UIButton!
    @IBOutlet weak var email: UIButton!
    
    @IBOutlet weak var students: UIButton!
    @IBOutlet weak var seats: UIButton!
    
    @IBOutlet weak var testTakersLbl: UILabel!
    @IBOutlet weak var readingScoreLbl: UILabel!
    @IBOutlet weak var mathScoreLbl: UILabel!
    @IBOutlet weak var writingScoreLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        bindData()
    }
    
    private func bindData() {
        titleLbl.text = school?.schoolName
        overview.text = school?.overviewParagraph

        location.setTitle(school?.location, for: .normal)
        
        phone.setTitle(school?.phoneNumber, for: .normal)
        email.setTitle(school?.schoolEmail, for: .normal)
        website.setTitle(school?.website, for: .normal)
        
        students.setTitle(school?.totalStudents, for: .normal)
        seats.setTitle(school?.seats9Ge1, for: .normal)
        
        testTakersLbl.text = result?.numOfSatTestTakers ?? defaultValue
        readingScoreLbl.text = result?.satCriticalReadingAvgScore ?? defaultValue
        mathScoreLbl.text = result?.satMathAvgScore ?? defaultValue
        writingScoreLbl.text = result?.satWritingAvgScore ?? defaultValue
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 3      // section 0 is the constact details
        case 1:
            return 1      // section 1 is the 2nd section Location
        case 2:
            return 2      // section 2 is the 3nd section Capacity
        case 3:
            return 4      // section 3 is the 4nd section Results
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}
