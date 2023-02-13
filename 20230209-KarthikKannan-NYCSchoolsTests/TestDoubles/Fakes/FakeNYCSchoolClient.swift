//
//  FakeNYCSchoolClient.swift
//  20230209-KarthikKannan-NYCSchoolsTests
//
//  Created by Kannan, Karthik (K.) on 2/11/23.
//

import Foundation

@testable import _0230209_KarthikKannan_NYCSchools

class FakeNYCSchoolClient: NYCSchoolClientele {
    
    var schoolList: NYCSchoolList = []
    func getSchoolList() async throws -> NYCSchoolList {
        return schoolList
    }
    
    var schoolDetails: NYCSchoolDetailsList = []
    func getSchoolDetails(dbn: String) async throws -> NYCSchoolDetailsList {
        return schoolDetails
    }
}
