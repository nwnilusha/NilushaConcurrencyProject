//
//  LoginViewModel.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 6/2/24.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import Firebase 
import SwiftUI
import Combine

@MainActor
final class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var correctEmail: Bool = false
    @Published var correctPassword: Bool = false
    var anyCancellables = Set<AnyCancellable>()
    
    init() {
        emailSubscriber()
        passwordSubscriber()
    }
    
    func emailSubscriber() {
        $email
            .sink { [weak self] email in
                guard let self = self else { return }
                if email.lowercased() == "abc@gmail.com" {
                    self.correctEmail = true
                } else {
                    self.correctEmail = false
                }
            }
            .store(in: &anyCancellables)
    }
    
    func passwordSubscriber() {
        $password
            .sink { [weak self] password in
                guard let self = self else { return }
                if password.lowercased() == "abc123" {
                    self.correctPassword = true
                } else {
                    self.correctPassword = false
                }
            }
            .store(in: &anyCancellables)
    }
    
    func validateEmailPassword() {
        if email.lowercased() == "abc@gmail.com" {
            correctEmail = true
        }
        if password.lowercased() == "abc123" {
            correctPassword = true
        }
    }
}
