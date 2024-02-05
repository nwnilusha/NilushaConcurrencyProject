//
//  UsersListViewModel.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 3/2/24.
//

import Foundation

class UsersListViewModel: ObservableObject {
    var service: Servicing
    @Published var users: [User] = []
    @Published var isLoading: Bool = false
    @Published var showAlert: Bool = false
    @Published var errorMessage: String?
    
    init(service: Servicing) {
        self.service = service
    }
    
    @MainActor
    func fetchUsers() async {
        isLoading.toggle()
        defer {
            isLoading.toggle()
        }

        let result: Result<[User], APIError> = await service.fetchUsers()
        
        switch result {
        case .success(let users):
            self.users = users
        case .failure(let error):
            showAlert = true
            errorMessage = error.localizedDescription + "\n Please contact the developer"
        }
    }
}

extension UsersListViewModel {
    convenience init(forPreview: Bool = false) {
        self.init()
        if forPreview {
            self.users = User.mockUsers
        }
    }
}
