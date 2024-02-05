//
//  Servicing.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 3/2/24.
//

import Foundation

protocol Servicing {
    func fetchUsers() async -> Result<[User], APIError>
    func fetchPosts(userId: Int) async -> Result<[Post], APIError>
}
