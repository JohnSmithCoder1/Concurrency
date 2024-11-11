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
            .alert("Application Error", isPresented: $viewModel.showAlert, actions: {
                Button("OK") {}
            }, message: {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                }
            })
            .navigationTitle("Posts")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .task {
                viewModel.userId = userId
                await viewModel.fetchPosts()
            }
        }
    }
}

#Preview {
    PostsListView(userId: 1)
}
