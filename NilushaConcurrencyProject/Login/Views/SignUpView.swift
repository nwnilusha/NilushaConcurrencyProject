//
//  SignUpView.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 6/2/24.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    
    @ObservedObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        ZStack {
            Color("BgColor").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                
                TextField("First Name", text: $viewModel.email)
                    .font(.title3)
                    .padding()
                    .foregroundColor(.black)
                    .frame(maxWidth:.infinity)
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                
                TextField("Last Name", text: $viewModel.email)
                    .font(.title3)
                    .padding()
                    .foregroundColor(.black)
                    .frame(maxWidth:.infinity)
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                
                TextField("Email", text: $viewModel.email)
                    .font(.title3)
                    .padding()
                    .foregroundColor(.black)
                    .frame(maxWidth:.infinity)
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                
                SecureField("Password", text: $viewModel.password)
                    .font(.title3)
                    .padding()
                    .foregroundColor(.black)
                    .frame(maxWidth:.infinity)
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                
                Button(action: {
                    //viewModel.signUp()
                }, label: {
                    PrimaryButton(title: "Sign Up")
                        .padding(.vertical)
                })
                Spacer()
                HStack {
                    Text("Already have an account?")
                    NavigationLink(destination: LoginView()
                        .navigationBarHidden(true),
                        label: {
                        Text("Sign in")
                            .foregroundColor(Color.blue.opacity(0.9))
                    })
                    
                }
            }
            .padding()
        }
    }
}
