//
//  User.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 3/2/24.
//

import Foundation

//https://jsonplaceholder.typicode.com/users
//https://jsonplaceholder.typicode.com/posts

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
