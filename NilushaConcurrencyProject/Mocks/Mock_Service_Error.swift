//
//  Mock_Service_Error.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 8/2/24.
//

import Foundation

class Mock_Service_Error: Servicing {
    func fetchUsers() async -> Result<[User], APIError> {
        return .failure(APIError.curruptData)
    }
    
    func fetchPosts(userId: Int) async -> Result<[Post], APIError> {
        return .failure(APIError.curruptData)
    }
    
    
}
