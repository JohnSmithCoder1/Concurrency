//
//  PostsListViewModel.swift
//  Concurrency
//
//  Created by J S on 10/23/24.
//

import Foundation

class PostsListViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    var userId: Int?
    
    func fetchPosts() {
        if let userId {
            let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users/\(userId)/posts")
            
            apiService.getJSON { (result: Result<[Post], APIError>) in
                switch result {
                case .success(let posts):
                    DispatchQueue.main.async {
                        self.posts = posts
                    }
                case .failure(let error):
                    print(error)
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
