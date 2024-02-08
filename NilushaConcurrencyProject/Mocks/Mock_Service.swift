//
//  Mock_Service.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 7/2/24.
//

import Foundation

class Mock_Service: Servicing {
    func fetchUsers() async -> Result<[User], APIError> {
        return .success(User.mockUsers)
    }
    
    func fetchPosts(userId: Int) async -> Result<[Post], APIError> {
        return .success(Post.mockPosts)
    }
    
    
}
