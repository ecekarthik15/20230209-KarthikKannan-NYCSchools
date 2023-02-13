//
//  FakeEndpoints.swift
//  20230209-KarthikKannan-NYCSchoolsTests
//
//  Created by Kannan, Karthik (K.) on 2/10/23.
//

import Foundation
@testable import _0230209_KarthikKannan_NYCSchools

class FakeEndpoints: Endpoint {
    
    var headers: [String : String]? = [:]
    
    var scheme: String = "https"
    
    var host: String = "."
    
    var path: String = ""
    
    var method: httpmethod = .get
    
    var query: [URLQueryItem]? = nil
    
    var body: Data? = nil
    
    var urlRequest: URLRequest? = nil
}
