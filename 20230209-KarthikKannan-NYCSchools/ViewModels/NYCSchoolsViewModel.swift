//
//  NYCSchoolsViewModel.swift
//  20230209-KarthikKannan-NYCSchools
//
//  Created by Kannan, Karthik (K.) on 2/10/23.
//

import Foundation


class NYCSchoolsViewModel: ObservableObject {
    
    let schoolClient: NYCSchoolClientele
    
    @Published var schoolList: [NYCSchool] = []
    @Published var schoolDetails: [NYCSchoolDetails] = []
    
    init(schoolClient: NYCSchoolClientele) {
        self.schoolClient = schoolClient
    }
    
    convenience init() {
        self.init(schoolClient: NYCSchoolClient())
    }
    
    func getSchools() async throws {
        
        let list = try await schoolClient.getSchoolList()
    
        await MainActor.run {
            schoolList = list
        }
    }
    
    func getSchoolDetails(dbn: String) async throws {
        
        let details = try await schoolClient.getSchoolDetails(dbn: dbn)
    
        await MainActor.run {
            schoolDetails = details
        }
    }
    
}
