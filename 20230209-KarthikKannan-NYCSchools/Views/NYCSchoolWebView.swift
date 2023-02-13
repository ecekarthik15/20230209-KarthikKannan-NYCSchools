//
//  NYCSchoolWebView.swift
//  20230209-KarthikKannan-NYCSchools
//
//  Created by Kannan, Karthik (K.) on 2/11/23.
//

import Foundation
import SwiftUI
import WebKit

struct NYCSchoolWebView: UIViewRepresentable {
 
    var url: String
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        if let url = URL(string: "https://\(url)") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
