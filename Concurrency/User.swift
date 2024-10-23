//
//  User.swift
//  Concurrency
//
//  Created by J S on 10/23/24.
//
// Source: https://jsonplaceholder.typicode.com/users

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
