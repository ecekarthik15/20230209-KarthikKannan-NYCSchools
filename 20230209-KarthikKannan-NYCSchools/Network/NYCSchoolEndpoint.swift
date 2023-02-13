//
//  NYCSchoolEndpoint.swift
//  20230209-KarthikKannan-NYCSchools
//
//  Created by Kannan, Karthik (K.) on 2/9/23.
//

import Foundation

enum NYCSchoolEndpoint: Endpoint {
    
    case getSchoolList
    case getSchoolDetails(String)
    
    var headers: [String : String]? {
        switch self {
        case .getSchoolList,
                .getSchoolDetails:
            return ["Accept": "*/*",
                    "Cache-Control": "no-cache",
                    "Host": "data.cityofnewyork.us",
                    "Accept-Encoding": "gzip, deflate",
                    "Connection": "keep-alive"]
        }
    }
    
    var scheme: String {
        switch self {
        case .getSchoolList,
                .getSchoolDetails:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .getSchoolList,
                .getSchoolDetails:
            return "data.cityofnewyork.us"
        }
    }
    
    var path: String {
        switch self {
        case .getSchoolList:
            return "/resource/s3k6-pzi2.json"
        case .getSchoolDetails:
            return "/resource/f9bf-2cp4.json"
        }
    }
    
    var method: httpmethod {
        switch self {
        case .getSchoolList,
                .getSchoolDetails:
            return .get
        }
    }
    
    var query: [URLQueryItem]? {
        switch self {
        case .getSchoolList:
            return nil
            
        case .getSchoolDetails(let dbn):
            return [URLQueryItem(name: "dbn", value: dbn)]
        }
    }
    
    var body: Data? {
        switch self {
        case .getSchoolList,
                .getSchoolDetails:
            return nil
        }
    }
}

