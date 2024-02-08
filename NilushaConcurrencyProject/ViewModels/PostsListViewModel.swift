//
//  PostListViewModel.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 3/2/24.
//

import Foundation

class PostsListViewModel: ObservableObject {
    var service: Servicing
    @Published var posts: [Post] = []
    var userId: Int?
    @Published var isLoading: Bool = false
    @Published var showAlert: Bool = false
    @Published var errorMessage: String?
    
    init(service: Servicing) {
        self.service = service
    }
    
    @MainActor
    func fetchPosts() async {
        if let userId = userId {
            isLoading.toggle()
            defer {
                isLoading.toggle()
            }

            let result: Result<[Post], APIError> = await service.fetchPosts(userId: userId)
            
            switch result {
            case .success(let posts):
                self.posts = posts
            case .failure(let error):
                showAlert = true
                errorMessage = error.localizedDescription + "\n Please contact the developer"
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

