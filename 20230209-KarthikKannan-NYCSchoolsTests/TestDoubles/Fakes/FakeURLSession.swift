//
//  FakeURLSession.swift
//  20230209-KarthikKannan-NYCSchoolsTests
//
//  Created by Kannan, Karthik (K.) on 2/10/23.
//

import Foundation
@testable import _0230209_KarthikKannan_NYCSchools

class FakeURLSession: URLSessionProtocol {
    var fakeResponse: (Data, URLResponse) = (Data(), URLResponse())
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        return fakeResponse
    }
}
