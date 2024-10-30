//
//  User.swift
//  TodoListSwiftUI
//
//  Created by cuongtran on 10/30/24.
//

import Foundation

struct User: Codable {
    let login: String
    let id: Double
    let avatar_url: String
    let url: String
    let html_url: String
    
    func avatarUrl() -> URL? {
        return URL(string: avatar_url)
    }
    
    func pageUrl() -> URL! {
        return URL(string: html_url)
    }
}
