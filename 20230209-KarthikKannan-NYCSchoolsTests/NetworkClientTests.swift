//
//  NetworkClientTests.swift
//  20230209-KarthikKannan-NYCSchoolsTests
//
//  Created by Kannan, Karthik (K.) on 2/9/23.
//

import XCTest
@testable import _0230209_KarthikKannan_NYCSchools

class NetworkClientTests: XCTestCase {
    
    var subject: NetworkClient!
    var fakeURLSesssion: FakeURLSession!
    
    override func setUp() {
        super.setUp()
        
        //dependencies
        fakeURLSesssion = FakeURLSession()
        
        subject = NetworkClient.init(session: fakeURLSesssion)
    }
    
    override func tearDown() {
        super.tearDown()
        
        subject = nil
        fakeURLSesssion = nil
    }
    
    func testNetworkClient() {
        XCTAssertNotNil(subject)
    }
    
    
    func testGetResponse_with_invalidURL() async throws {
        
        //dependencies
        let fakeEndpoint = FakeEndpoints()
        fakeEndpoint.path = "fakePath"
        
        let expectedError = APIError.invalidUrl
        
        //when
        do {
            let _: FakeCodable = try await subject.getResponse(endPoint: fakeEndpoint)
        } catch(let error) {
            //result
            XCTAssertEqual(expectedError, error as? APIError)
        }
     }
    
    func testGetResponse_with_200_responsecode() async throws {
        
        //dependencies
        let fakeEndpoint = NYCSchoolEndpoint.getSchoolList
        
        let fakehttpResponse = HTTPURLResponse(url: URL(string: fakeEndpoint.urlString)!,
                                               statusCode: 200,
                                               httpVersion: nil, headerFields: [:])
        
        let expectedResult = FakeCodable(id: 1, name: "test")
        
        fakeURLSesssion.fakeResponse = (try JSONEncoder().encode(expectedResult), fakehttpResponse!)
                
        //when
        let result: FakeCodable = try await subject.getResponse(endPoint: fakeEndpoint)

        XCTAssertEqual(expectedResult, result)
     }
    
    func testGetResponse_with_invalid_responsecode() async throws {
        
        //dependencies
        let fakeEndpoint = NYCSchoolEndpoint.getSchoolList
        
        let expectedError = APIError.responseNA
                        
        //when
        do {
            let _: FakeCodable = try await subject.getResponse(endPoint: fakeEndpoint)
        } catch(let error) {
            //result
            XCTAssertEqual(expectedError, error as? APIError)
        }
     }

}
