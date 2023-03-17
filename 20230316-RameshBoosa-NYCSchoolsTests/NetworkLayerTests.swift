//
//  NetworkLayerTests.swift
//  20230316-RameshBoosa-NYCSchools
//
//  Created by Ramesh Boosa on 3/16/23.
//

import UIKit
import XCTest

@testable import _0230316_RameshBoosa_NYCSchools

class NetworkLayerTests: XCTestCase {
    
    var sut: MockNetworkLayer!
    
    override func setUp() {
        super.setUp()
        sut = MockNetworkLayer()
    }
    
    // TODO: we can improve these test case if we could create mock session to run these tests with mock urls and compare
    
    func testFetchSchools() async throws {
           let url = URL(string: "https://example.com/schools")!
        let schools = try await MockNetworkLayer.fetchSchools(from: url, using: URLSession.shared)
           
        XCTAssertEqual(schools.count, 10)
       }
       
       func testFetchResults() async throws {
           let url = URL(string: "https://example.com/results")!
           let results = try await MockNetworkLayer.fetchResults(from: url, using: URLSession.shared)
           
           XCTAssertEqual(results.count, 10)
       }
    
   
}

class MockNetworkLayer: SchoolsDelegate, ResultsDelegate {
    
    var schoolsFetched: Bool = false
    var resultsFetched: Bool = false
    
    static func fetchMockData(from fileName: String) async throws -> Data {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                 return data
              } catch let error {
                  print(error.localizedDescription)
              }
        }
        return Data()
    }

    static func fetchSchools(from url: URL, using session: URLSession) async throws -> Schools {
        let data = try await MockNetworkLayer.fetchMockData(from: "schools")
        return try JSONDecoder().decode(Schools.self, from: data)
    }
    
    static func fetchResults(from url: URL, using session: URLSession) async throws -> Results {
        let data = try await MockNetworkLayer.fetchMockData(from: "results")
        return try JSONDecoder().decode(Results.self, from: data)
    }
}




