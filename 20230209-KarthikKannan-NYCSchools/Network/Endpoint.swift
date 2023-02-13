//
//  Endpoint.swift
//  20230209-KarthikKannan-NYCSchools
//
//  Created by Kannan, Karthik (K.) on 2/9/23.
//

import Foundation

protocol Endpoint {
    var headers: [String:String]? { get }
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: httpmethod { get }
    var query: [URLQueryItem]? { get }
    var body: Data? { get }
}

enum httpmethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

extension Endpoint {
    var urlString: String {
        return requestUrl?.absoluteString ?? ""
    }
    
    var requestUrl: URL? {
        var urlComponenets = URLComponents()
        urlComponenets.path = path
        urlComponenets.scheme = scheme
        urlComponenets.host = host
        urlComponenets.queryItems = query
                
        return urlComponenets.url
    }
    
    var urlRequest: URLRequest? {
        print("urlRequest: ", requestUrl)
        print("path: ", path)

        guard let url = requestUrl else { return nil }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        if let body = body {
            request.httpBody = body
        }
        request.httpMethod = method.rawValue
        
        return request
    }
}

