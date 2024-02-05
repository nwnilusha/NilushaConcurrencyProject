//
//  Service.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 3/2/24.
//

import Foundation

class Service: Servicing {
    
    var userId: Int = 1
    private let usersURL = "https://jsonplaceholder.typicode.com/users"
    private let postsUrl = "https://jsonplaceholder.typicode.com/users/&/posts"
    
    func fetchUsers() async -> Result<[User], APIError> {
        
        do {
            let apiService = ApiService(urlString: usersURL)
            let response: [User] = try await apiService.getJSON()
            return .success(response)
        } catch {
            return .failure(.curruptData)
        }
    }
    
    func fetchPosts(userId: Int) async -> Result<[Post], APIError> {
        let postUrlForUser = postsUrl.replacingOccurrences(of: "&", with: String(userId))
        do {
            let apiService = ApiService(urlString: postUrlForUser)
            let response: [Post] = try await apiService.getJSON()
            return .success(response)
        } catch {
            return .failure(.curruptData)
        }
    }
}
