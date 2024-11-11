//
//  UserAndPosts.swift
//  Concurrency
//
//  Created by J S on 11/11/24.
//

import Foundation

struct UserAndPosts: Identifiable {
    let id = UUID()
    let user: User
    let posts: [Post]
    var numberOfPosts: Int {
        posts.count
    }
}
