//
//  MockData.swift
//  Concurrency
//
//  Created by J S on 10/23/24.
//

import Foundation

extension User {
    static var mockUsers: [User] {
        Bundle.main.decode([User].self, from: "users.json")
    }
    
    static var mockSingleUser: User {
        Self.mockUsers[0]
    }
}

extension Post {
    static var mockPosts: [Post] {
        Bundle.main.decode([Post].self, from: "users.json")
    }
    
    static var mockSinglePost: Post {
        Self.mockPosts[0]
    }
    
    static var mockSingleUsersPosts: [Post] {
        Self.mockPosts.filter { $0.userId == 1 }
    }
}
