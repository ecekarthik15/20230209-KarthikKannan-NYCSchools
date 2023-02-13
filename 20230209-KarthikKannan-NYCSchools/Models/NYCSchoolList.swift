//
//  NYCSchoolList.swift
//  20230209-KarthikKannan-NYCSchools
//
//  Created by Kannan, Karthik (K.) on 2/10/23.
//

import Foundation

struct NYCSchool: Codable, Equatable {
    let dbn: String
    let name: String
    let boro: String
    let overview: String
    let school10thSeats: String?
    let academicopportunities1: String?
    let academicopportunities2: String?
    let ellPrograms: String
    let neighborhood: String
    let buildingCode: String?
    let location: String
    let phoneNumber: String
    let faxNumber: String?
    let email: String?
    let website: String
    let subway: String
    let bus: String
    let grades2018: String
    let finalgrades: String
    let totalStudents: String
    let extracurricularActivities: String?
    let schoolSports: String?
    let attendanceRate: String
    let pctStuEnoughVariety: String?
    let pctStuSafe: String?
    let schoolAccessibilityDescription: String?
    let directions1: String?
    let requirement1: String?
    let requirement2: String?
    let requirement3: String?
    let requirement4: String?
    let requirement5: String?
    let offerRate1: String?
    let program1: String
    let code1: String
    let interest1: String
    let method1: String
    let seats9ge1: String?
    let grade9gefilledflag1: String?
    let grade9geapplicants1: String?
    let seats9swd1: String?
    let grade9swdfilledflag1: String?
    let grade9swdapplicants1: String?
    let seats101: String
    let admissionspriority11: String?
    let admissionspriority21: String?
    let admissionspriority31: String?
    let grade9geapplicantsperseat1: String?
    let grade9swdapplicantsperseat1: String?
    let primaryAddressLine1: String
    let city: String
    let zip: String
    let stateCode: String
    let latitude: String?
    let longitude: String?
    let communityBoard: String?
    let councilDistrict: String?
    let censusTract: String?
    let bin: String?
    let bbl: String?
    let nta: String?
    let borough: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case name = "school_name"
        case boro
        case overview = "overview_paragraph"
        case school10thSeats = "school_10th_seats"
        case academicopportunities1
        case academicopportunities2
        case ellPrograms = "ell_programs"
        case neighborhood
        case buildingCode = "building_code"
        case location
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case email = "school_email"
        case website
        case subway
        case bus
        case grades2018
        case finalgrades
        case totalStudents = "total_students"
        case extracurricularActivities = "extracurricular_activities"
        case schoolSports = "school_sports"
        case attendanceRate = "attendance_rate"
        case pctStuEnoughVariety = "pct_stu_enough_variety"
        case pctStuSafe = "pct_stu_safe"
        case schoolAccessibilityDescription = "school_accessibility_description"
        case directions1
        case requirement1 = "requirement1_1"
        case requirement2 = "requirement2_1"
        case requirement3 = "requirement3_1"
        case requirement4 = "requirement4_1"
        case requirement5 = "requirement5_1"
        case offerRate1 = "offer_rate1"
        case program1
        case code1
        case interest1
        case method1
        case seats9ge1
        case grade9gefilledflag1
        case grade9geapplicants1
        case seats9swd1
        case grade9swdfilledflag1
        case grade9swdapplicants1
        case seats101
        case admissionspriority11
        case admissionspriority21
        case admissionspriority31
        case grade9geapplicantsperseat1
        case grade9swdapplicantsperseat1
        case primaryAddressLine1 = "primary_address_line_1"
        case city
        case zip
        case stateCode = "state_code"
        case latitude
        case longitude
        case communityBoard = "community_board"
        case councilDistrict = "council_district"
        case censusTract = "census_tract"
        case bin
        case bbl
        case nta
        case borough
    }
    
    var address: String {
        "\(primaryAddressLine1), \(city), \(zip) - \(stateCode)"
    }
}

typealias NYCSchoolList = [NYCSchool]
