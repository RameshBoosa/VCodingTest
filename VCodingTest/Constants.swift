//
//  Constants.swift
//  VCodingTest
//
//  Created by Ramesh Boosa on 3/16/23.
//

import UIKit

enum Constants: String {
    case schools
    case results
    
    var description: String {
        switch self {
        case .schools:
            return "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        case .results:
            return "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
        }
    }
}
