//
//  FakeCodable.swift
//  20230209-KarthikKannan-NYCSchoolsTests
//
//  Created by Kannan, Karthik (K.) on 2/10/23.
//

import Foundation

class FakeCodable: Codable, Equatable {
    
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    static func == (lhs: FakeCodable, rhs: FakeCodable) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name
    }
}
