//
//  NYCSchoolDetails.swift
//  20230209-KarthikKannan-NYCSchools
//
//  Created by Kannan, Karthik (K.) on 2/10/23.
//

import Foundation

struct NYCSchoolDetails: Codable, Equatable {
    let dbn: String
    let name: String
    let noOfSatTestTakers: String
    let satCriticaReadingAvgScore: String
    let satMathAvgScore: String
    let satWritingAvgScore: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case name = "school_name"
        case noOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticaReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
}

typealias NYCSchoolDetailsList = [NYCSchoolDetails]
