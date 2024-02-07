//
//  LoginView.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 6/2/24.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject private var viewModel: LoginViewModel

    init() {
        viewModel = LoginViewModel()
    }
    var body: some View {
        ZStack {
            Color("BgColor").edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                VStack {
                    Text("Sign In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 30)
                    TextField("Email", text: $viewModel.email)
                        .font(.title3)
                        .padding()
                        .foregroundColor(.black)
                        .frame(maxWidth:.infinity)
                        .background(Color.white)
                        .cornerRadius(50)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                        .padding(.vertical)
                    
                    SecureField("Password", text: $viewModel.password)
                        .font(.title3)
                        .padding()
                        .foregroundColor(.black)
                        .frame(maxWidth:.infinity)
                        .background(Color.white)
                        .cornerRadius(50)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                    
                    HStack {
                        Text("New Uaser?")
                        NavigationLink(destination: SignUpView()
                            .navigationBarHidden(true),
                            label: {
                            Text("Create Account")
                                .foregroundColor(Color.blue.opacity(0.9))
                        })
                    }
                    
                    Button(action: {
                        //viewModel.signUp()
                    }, label: {
                        PrimaryButton(title: "Sign In")
                            .padding(.vertical)
                    })
                    
                    SocialinButton(image: "Apple", title: Text("Sign in with Apple"))
                    SocialinButton(image: "Google", title: Text("Sign in with Google").foregroundColor(Color("PrimaryColor")))
                        .padding(.vertical)
                    

                }
                Spacer()
                Divider()
                Spacer()
                Text("You are completely safe")
                Text("Read your tearms and conditions")
                    .foregroundColor(Color("PrimaryColor"))
                Spacer()
            }
            .padding()
        }
        
        
    }
}

struct SocialinButton: View {
    var image: String
    var title: Text
    var body: some View {
        HStack {
            Image(image)
                .padding(.horizontal)
            Spacer()
            title
                .font(.title3)
            Spacer()
        }
        .padding()
        .foregroundColor(.black)
        .frame(maxWidth:.infinity)
        .background(Color.white)
        .cornerRadius(50)
        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
    }
}
