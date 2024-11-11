//
//  PostsListView.swift
//  Concurrency
//
//  Created by J S on 10/23/24.
//

import SwiftUI

struct PostsListView: View {
    var posts: [Post]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Posts")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
        }
    }
}
