//
//  NYCSchoolEndpointTests.swift
//  20230209-KarthikKannan-NYCSchoolsTests
//
//  Created by Kannan, Karthik (K.) on 2/9/23.
//

import XCTest
@testable import _0230209_KarthikKannan_NYCSchools

class NYCSchoolEndpointTests: XCTestCase {
    
    
    func testGetSchoolListUrl() {
        
        let endpoint = NYCSchoolEndpoint.getSchoolList
        let expectedUrlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        
        XCTAssertEqual(endpoint.urlString, expectedUrlString)
        XCTAssertNotNil(endpoint.requestUrl)
        XCTAssertNotNil(endpoint.urlRequest)

    }
    
    func testGetSchoolListHeaders() {
        let endpoint = NYCSchoolEndpoint.getSchoolList

        let expectedHeaders = ["Accept": "*/*",
                               "Cache-Control": "no-cache",
                               "Host": "data.cityofnewyork.us",
                               "Accept-Encoding": "gzip, deflate",
                               "Connection": "keep-alive"]
        
        XCTAssertEqual(endpoint.headers, expectedHeaders)

    }
    
    func testGetSchoolListRequestBody() {
        let endpoint = NYCSchoolEndpoint.getSchoolList
        XCTAssertNil(endpoint.body)
    }
    
    func testGetSchoolListRequestHTTPMethod() {
        let endpoint = NYCSchoolEndpoint.getSchoolList
        XCTAssertEqual(endpoint.method, .get)
    }
    
    func testGetSchoolListRequestScheme() {
        let endpoint = NYCSchoolEndpoint.getSchoolList
        XCTAssertEqual(endpoint.scheme, "https")
    }
    
    func testGetSchoolListRequestHost() {
        let endpoint = NYCSchoolEndpoint.getSchoolList
        XCTAssertEqual(endpoint.host, "data.cityofnewyork.us")
    }
    
    func testGetSchoolListRequestPath() {
        let endpoint = NYCSchoolEndpoint.getSchoolList
        XCTAssertEqual(endpoint.path, "/resource/s3k6-pzi2.json")
    }
    
    func testGetSchoolListRequestQuery() {
        let endpoint = NYCSchoolEndpoint.getSchoolList
        XCTAssertNil(endpoint.query)
    }
    
    func testGetSchoolDetailsUrl() {
        
        let endpoint = NYCSchoolEndpoint.getSchoolDetails("test")
        let expectedUrlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=test"
        
        XCTAssertEqual(endpoint.urlString, expectedUrlString)
        XCTAssertNotNil(endpoint.requestUrl)
        XCTAssertNotNil(endpoint.urlRequest)

    }
    
    func testGetSchoolDetailsHeaders() {
        let endpoint = NYCSchoolEndpoint.getSchoolDetails("test")

        let expectedHeaders = ["Accept": "*/*",
                               "Cache-Control": "no-cache",
                               "Host": "data.cityofnewyork.us",
                               "Accept-Encoding": "gzip, deflate",
                               "Connection": "keep-alive"]
        
        XCTAssertEqual(endpoint.headers, expectedHeaders)

    }
    
    func testGetSchoolDetailsRequestBody() {
        let endpoint = NYCSchoolEndpoint.getSchoolDetails("test")
        XCTAssertNil(endpoint.body)
    }
    
    func testGetSchoolDetailsRequestHTTPMethod() {
        let endpoint = NYCSchoolEndpoint.getSchoolDetails("test")
        XCTAssertEqual(endpoint.method, .get)
    }
    
    func testGetSchoolDetailsRequestScheme() {
        let endpoint = NYCSchoolEndpoint.getSchoolDetails("test")
        XCTAssertEqual(endpoint.scheme, "https")
    }
    
    func testGetSchoolDetailsRequestHost() {
        let endpoint = NYCSchoolEndpoint.getSchoolDetails("test")
        XCTAssertEqual(endpoint.host, "data.cityofnewyork.us")
    }
    
    func testGetSchoolDetailsRequestPath() {
        let endpoint = NYCSchoolEndpoint.getSchoolDetails("test")
        XCTAssertEqual(endpoint.path, "/resource/f9bf-2cp4.json")
    }
    
    func testGetSchoolDetailsRequestQuery() {
        let expectedResult = [URLQueryItem.init(name: "dbn", value: "test")]
        let endpoint = NYCSchoolEndpoint.getSchoolDetails("test")
        XCTAssertEqual(endpoint.query, expectedResult)
    }
}

