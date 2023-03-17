//
//  MainCoordinator.swift
//  VCodingTest
//
//  Created by Ramesh Boosa on 3/16/23.
//

import UIKit

// given more time to simplify and make app navigations smooth with coordinator

class MainCoordinator: Coordinator {
    var childrenCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    var school: School?
    var result: SATResult?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewcontroller = SchoolsViewController.instatiateViewController()
        viewcontroller.coordinator = self
        navigationController.pushViewController(viewcontroller, animated: false)
    }
    
    func showDetailVC() {
        let viewcontroller = SchoolDetailTableViewController.instatiateViewController()
        viewcontroller.coordinator = self
        viewcontroller.school = school
        viewcontroller.result = result
        navigationController.pushViewController(viewcontroller, animated: false)
    }
}
