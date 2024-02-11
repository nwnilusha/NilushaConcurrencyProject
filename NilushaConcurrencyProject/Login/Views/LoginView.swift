//
//  LoginView.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 6/2/24.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import Firebase 

struct LoginView: View {

    @ObservedObject private var viewModel: LoginViewModel
    @State var activated: Bool = false
    @State var textfieldColor: Color = Color.black

    init() {
        viewModel = LoginViewModel()
    }
    var body: some View {
        NavigationView {
            ZStack {
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
                            .frame(maxWidth:.infinity)
                            .background(Color.white)
                            .cornerRadius(50)
                            .padding(.bottom, 10)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                            .overlay(
                                ZStack{
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.green)
                                        .opacity(viewModel.correctEmail ? 1.0 : 0.0)
                                }
                                    .font(.headline)
                                    .padding(.trailing)
                                ,alignment: .trailing
                            )
                        .padding(.bottom)
                        
                        SecureField("Password", text: $viewModel.password)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth:.infinity)
                            .background(Color.white)
                            .cornerRadius(50)
                            .padding(.bottom, 10)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                            .overlay(
                                ZStack{
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.green)
                                        .opacity(viewModel.correctPassword ? 1.0 : 0.0)
                                }
                                    .font(.headline)
                                    .padding(.trailing)
                                ,alignment: .trailing
                            )
                        
                        Button(action: {
                            if viewModel.correctEmail && viewModel.correctPassword {
                                activated = true
                            }                            
                        }, label: {
                            PrimaryButton(title: "Sign In", enabled: viewModel.correctEmail && viewModel.correctPassword)
                                .padding(.vertical)
                        })
                        .disabled(!(viewModel.correctEmail && viewModel.correctPassword))
                        
                        NavigationLink(destination: UsersListView()
                            .navigationBarHidden(true),
                                       isActive: $activated) {
                            EmptyView()
                        }
                        
                        SocialinButton(image: "Apple", title: Text("Sign in with Apple"))
                        Button {
                            guard let clientID = FirebaseApp.app()?.options.clientID else { return }

                            // Create Google Sign In configuration object.
                            let config = GIDConfiguration(clientID: clientID)
                            GIDSignIn.sharedInstance.configuration = config

                            // Start the sign in flow!
                            GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { result, error in
                              guard error == nil else {
                                  return
                              }

                              guard let user = result?.user,
                                let idToken = user.idToken?.tokenString
                              else {
                                  return
                              }

                              let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                                             accessToken: user.accessToken.tokenString)

                                Auth.auth().signIn(with: credential) { result, error in
                                    guard error == nil else {
                                        return
                                    }
                                    activated = true
                                }
                            }
                        } label: {
                            SocialinButton(image: "Google", title: Text("Sign in with Google").foregroundColor(Color("PrimaryColor")))
                                .padding(.vertical)
                        }

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
