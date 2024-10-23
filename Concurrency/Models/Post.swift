//
//  Post.swift
//  Concurrency
//
//  Created by J S on 10/23/24.
//
// Source: https://jsonplaceholder.typicode.com/posts
// Single User's posts: https://jsonplaceholder.typicode.com/users/1/posts

import Foundation

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
