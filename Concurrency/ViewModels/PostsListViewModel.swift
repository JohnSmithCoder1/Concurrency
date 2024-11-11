//
//  PostsListViewModel.swift
//  Concurrency
//
//  Created by J S on 10/23/24.
//

import Foundation

class PostsListViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    var userId: Int?
    
    @MainActor
    func fetchPosts() async {
        if let userId {
            let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users/\(userId)/posts")
            isLoading = true
            
            defer {
                isLoading = false
            }
            
            do {
                posts = try await apiService.getJSON()
            } catch {
                showAlert = true
                errorMessage = error.localizedDescription
            }
        }
    }
}

extension PostsListViewModel {
    convenience init(forPreview: Bool = false) {
        self.init()
        
        if forPreview {
            self.posts = Post.mockPosts
        }
    }
}
