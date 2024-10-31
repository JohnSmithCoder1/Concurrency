//
//  PostsListView.swift
//  Concurrency
//
//  Created by J S on 10/23/24.
//

import SwiftUI

struct PostsListView: View {
    @StateObject var viewModel = PostsListViewModel()
    var userId: Int?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .navigationTitle("Posts")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .onAppear {
                viewModel.userId = userId
                viewModel.fetchPosts()
            }
        }
    }
}

#Preview {
    PostsListView(userId: 1)
}
