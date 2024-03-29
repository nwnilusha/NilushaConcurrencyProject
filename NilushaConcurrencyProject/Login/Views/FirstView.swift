//
//  FirstView.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 6/2/24.
//

import Foundation
import SwiftUI

struct FirstView : View {
    var body: some View {
        NavigationView {
            ZStack {
                //Color("BgColor").edgesIgnoringSafeArea(.all)
                VStack(spacing: 10) {
                    Spacer()
                    Image("Onboard")
                    Spacer()
                    NavigationLink(destination: LoginView()
                        .navigationBarHidden(true),
                        label: {
                        PrimaryButton(title: "Getting Start", enabled: true)
                    })
                    
                    NavigationLink(destination: LoginView()
                        .navigationBarHidden(true),
                        label: {
                        Text("Sign In")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color("PrimaryColor"))
                            .padding()
                            .frame(maxWidth:.infinity)
                            .background(.white)
                            .cornerRadius(50)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                            .padding(.vertical)
                    })
                }
                .padding()
            }
        }
        
    }
}

struct PrimaryButton: View {
    var title: String
    var enabled: Bool
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth:.infinity)
            .padding()
            .background(enabled ? Color("PrimaryColor") : Color.gray)
            .cornerRadius(50)
            
    }
}
