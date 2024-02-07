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

@MainActor
final class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var correctEmail: Bool = false
    @Published var correctPassword: Bool = false
    @Published var correctLoginDetails: Bool = false
    
    func validateEmailPassword() {
        if email.lowercased() == "abc@gmail.com" {
            correctEmail = true
        }
        if password.lowercased() == "abc123" {
            correctPassword = true
        }
    }
}
