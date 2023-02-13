//
//  NYCSchoolClient.swift
//  20230209-KarthikKannan-NYCSchools
//
//  Created by Kannan, Karthik (K.) on 2/10/23.
//

import Foundation

class NYCSchoolClient: NYCSchoolClientele {
    
    let networkClient: NetworkClientele
    init(networkClient: NetworkClientele) {
        self.networkClient = networkClient
    }
    
    convenience init() {
        self.init(networkClient: NetworkClient(session: URLSession.shared))
    }
    
    func getSchoolList() async throws -> NYCSchoolList {
        
        let schoolList: NYCSchoolList = try await networkClient.getResponse(endPoint: NYCSchoolEndpoint.getSchoolList)
        
        return schoolList
    }
    
    func getSchoolDetails(dbn: String) async throws -> NYCSchoolDetailsList{
        
        let schoolDetailsList: NYCSchoolDetailsList = try await networkClient.getResponse(endPoint: NYCSchoolEndpoint.getSchoolDetails(dbn))
        
        return schoolDetailsList

    }
}
