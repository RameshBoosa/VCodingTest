//
//  SchoolsViewModel.swift
//  VCodingTest
//
//  Created by Ramesh Boosa on 3/16/23.
//

import Foundation

class SchoolsViewModel {
    
    @Published var schools: Schools = []
    @Published var results: Results = []
    
    let dispatchGroup = DispatchGroup()
    
    func fetchData() {
        dispatchGroup.enter()   // <<-- invoke fetchschools
        fetchschools()
        
        dispatchGroup.enter()   // <<-- invoke fetchresults
        fetchResults()
        
        dispatchGroup.notify(queue: .main) {
            // whatever you want to do when both are done
            print("task completed")
        }
    }
    
    func fetchschools() {
        
        guard let url = URL(string: Constants.schools.description) else {
            return
        }
        
        // async task start
        Task {
            do {
                // fetch and update publisher
                schools = try await NetworkLayer.fetchSchools(from: url, using: URLSession.shared)
                print("schools: \(schools.count)")
                
            } catch {
                ///  should handle errors
                print("Request failed with error: \(error)")
            }
            
        }
    }
    
    func fetchResults() {
        
        guard let url = URL(string: Constants.results.description) else {
            return
        }
        
        // async task start
        Task {
            do {
                // fetch and update publisher
                results = try await NetworkLayer.fetchResults(from: url, using: URLSession.shared)
                print("results: \(results.count)")
            } catch {
                ///  should handle errors
                print("Request failed with error: \(error)")
            }
        }
    }
    
}
