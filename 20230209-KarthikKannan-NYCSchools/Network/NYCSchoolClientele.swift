//
//  NYCSchoolClientele.swift
//  20230209-KarthikKannan-NYCSchools
//
//  Created by Kannan, Karthik (K.) on 2/10/23.
//

import Foundation

protocol NYCSchoolClientele {
    func getSchoolList() async throws -> NYCSchoolList
    func getSchoolDetails(dbn: String) async throws -> NYCSchoolDetailsList
}
