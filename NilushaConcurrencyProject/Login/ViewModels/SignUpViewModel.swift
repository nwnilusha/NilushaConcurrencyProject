//
//  SignUpViewModel.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 6/2/24.
//

import SwiftUI
import CoreData

@MainActor
class SignUpViewModel: ObservableObject {
    let container:NSPersistentContainer
    @Published var savedEntitys: [UserData] = []
    @Published var email: String = ""
    @Published var password: String = ""
    //@Published var newUser: ApplicationUser
    
    init() {
        container = NSPersistentContainer(name: "UserContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading core data \(error)")
            } else {
                print("Successfully setup core data")
            }
        }
        fetchUser()
    }
    
    func fetchUser() {
        let request = NSFetchRequest<UserData>(entityName: "UserData")
        do {
            savedEntitys = try container.viewContext.fetch(request)
        } catch let error {
            print("Fetch request error \(error)")
        }
    }
    
    func addUser(user: ApplicationUser) {
        let newUser = UserData(context: container.viewContext)
        newUser.firstName = user.firstName
        newUser.lastName = user.lastName
        newUser.email = user.email
        newUser.password = user.password
        saveData()
    }
    
    func updateUser(entity: UserData) {
        let currentName = entity.firstName ?? ""
        let newName = currentName + "!"
        entity.firstName = newName
        saveData()
    }
    
    func deleteUser(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedEntitys[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchUser()
        } catch let error {
            print("Error saving \(error)")
        }
    }
}
