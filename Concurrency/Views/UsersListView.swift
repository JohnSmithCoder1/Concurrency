//
//  UsersList.swift
//  Concurrency
//
//  Created by J S on 10/23/24.
//

import SwiftUI

struct UsersListView: View {
    @StateObject var viewModel = UsersListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.usersAndPosts) { userAndPosts in
                    NavigationLink {
                        PostsListView(posts: userAndPosts.posts)
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(userAndPosts.user.name)
                                    .font(.title)
                               
                                Spacer()
                                
                                Text("(\(userAndPosts.numberOfPosts))")
                            }
                            Text(userAndPosts.user.email)
                        }
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
            .navigationTitle("Users")
            .listStyle(.plain)
            .task {
                await viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    UsersListView()
}
