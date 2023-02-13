//
//  FakeURLResponseProtocol.swift
//  20230209-KarthikKannan-NYCSchoolsTests
//
//  Created by Kannan, Karthik (K.) on 2/10/23.
//

import Foundation
@testable import _0230209_KarthikKannan_NYCSchools

class FakeURLResponse: URLResponseProtocol {
    var status: Int = 500
}
