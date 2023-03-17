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
    let dbn, schoolName, boro, overviewParagraph: String?
    let neighborhood, buildingCode, location, phoneNumber: String?
    let faxNumber, schoolEmail, website, bus: String?
    let grades2018, finalgrades, totalStudents, extracurricularActivities: String?
    let schoolSports, attendanceRate, requirement11, requirement21: String?
    let requirement31, requirement41, requirement51, offerRate1: String?
    let program1, code1, interest1, seats9Ge1: String?
    let grade9Gefilledflag1, admissionspriority11, admissionspriority21, admissionspriority31: String?
    let latitude, longitude: String?

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case boro
        case overviewParagraph = "overview_paragraph"
        case neighborhood
        case buildingCode = "building_code"
        case location
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case website, bus, grades2018, finalgrades
        case totalStudents = "total_students"
        case extracurricularActivities = "extracurricular_activities"
        case schoolSports = "school_sports"
        case attendanceRate = "attendance_rate"
        case requirement11 = "requirement1_1"
        case requirement21 = "requirement2_1"
        case requirement31 = "requirement3_1"
        case requirement41 = "requirement4_1"
        case requirement51 = "requirement5_1"
        case offerRate1 = "offer_rate1"
        case program1, code1, interest1
        case seats9Ge1 = "seats9ge1"
        case grade9Gefilledflag1 = "grade9gefilledflag1"
        case admissionspriority11, admissionspriority21, admissionspriority31, latitude, longitude
    }
}
