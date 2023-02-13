//
//  NetworkClientele.swift
//  20230209-KarthikKannan-NYCSchools
//
//  Created by Kannan, Karthik (K.) on 2/9/23.
//

import Foundation

import Foundation
typealias NetworkCompletionHandler = (URLResponseProtocol?, Data?, Error?) -> Void

protocol URLSessionProtocol {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
    
//    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher
}

protocol URLResponseProtocol {
    var status: Int { get }
}

protocol NetworkClientele {
    func getResponse<T: Decodable>(endPoint: Endpoint) async throws -> T
}

extension URLResponse: URLResponseProtocol {
    var status: Int {
        return (self as? HTTPURLResponse)?.statusCode ?? 500
    }
}

extension URLSession: URLSessionProtocol { }
