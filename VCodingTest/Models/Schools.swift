//
//  Schools.swift
//  VCodingTest
//
//  Created by Ramesh Boosa on 3/16/23.
//

import Foundation

typealias Schools = [School]

// MARK: - School
struct School: Codable {
    let dbn, schoolName, overviewParagraph: String?
    let location, phoneNumber: String?
    let schoolEmail, website, bus: String?
    let totalStudents, seats9Ge1: String?
    

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case overviewParagraph = "overview_paragraph"
        case location
        case phoneNumber = "phone_number"
        case schoolEmail = "school_email"
        case website, bus
        case seats9Ge1 = "seats9ge1"
        case totalStudents = "total_students"
    }
}
