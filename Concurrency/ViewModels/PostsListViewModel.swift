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
    
    func fetchPosts() {
        if let userId {
            let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users/\(userId)/posts")
            isLoading.toggle()
            
            // using asyncAfter to test loading spinner
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                apiService.getJSON { (result: Result<[Post], APIError>) in
                    defer {
                        DispatchQueue.main.async {
                            self.isLoading.toggle()
                        }
                    }
                    switch result {
                    case .success(let posts):
                        DispatchQueue.main.async {
                            self.posts = posts
                        }
                    case .failure(let error):
                        DispatchQueue.main.async {
                            self.errorMessage = error.localizedDescription + "\nPlease contact the developer and provide this error and the steps to reproduce."
                            self.showAlert.toggle()
                        }
                    }
                }
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
