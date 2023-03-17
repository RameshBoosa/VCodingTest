//
//  SchoolsViewControllerTests.swift
//  VCodingTestTests
//
//  Created by Ramesh Boosa on 3/16/23.
//

import UIKit
import XCTest

@testable import VCodingTest

class SchoolsViewControllerTests:  XCTestCase {
    
    var vc: SchoolsViewController? = nil
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "SchoolsViewController") as? SchoolsViewController
        _ = vc?.view
        XCTAssertNotNil(vc?.tableview)
    }
    
    override func tearDown() {
        vc = nil
        super.tearDown()
    }
    
    private func createSUT() -> SchoolsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "SchoolsViewController") as? SchoolsViewController
        
        return vc ?? SchoolsViewController()
    }
    
    // TODO: I wish I could spend more time to write better test cases to test data sources given properly for tableview and checking with mock data
    
    func testView() {
        let sut = createSUT()
        XCTAssertNotNil(sut.view, "view doesn't exist")
    }
    
    func testTableView() {
        XCTAssertNotNil(vc?.tableview, "tableview instance doesn't exist")
    }
    
    func testViewMOdel() {
        XCTAssertNotNil(vc?.viewModel, "viewmodel instance doesn't exist")
    }
    
    func testDataSourceElements() {
        XCTAssertEqual(vc?.schoolsDataSource.count, 0)
    }
}
