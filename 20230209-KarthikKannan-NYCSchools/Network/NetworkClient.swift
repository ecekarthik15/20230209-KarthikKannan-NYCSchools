//
//  NetworkClient.swift
//  20230209-KarthikKannan-NYCSchools
//
//  Created by Kannan, Karthik (K.) on 2/9/23.
//

import Foundation
import Combine

enum APIError: Error {
    case invalidUrl
    case responseNA
    case noData
}

actor NetworkClient: NetworkClientele {
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    func getResponse<T: Decodable>(endPoint: Endpoint) async throws -> T {
        guard let request = endPoint.urlRequest else { throw APIError.invalidUrl }
        
        let (data, response) = try await session.data(for: request, delegate: nil)

        switch response.status {
        case 200..<300:
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        default:
            throw APIError.responseNA
        }
    }
}
