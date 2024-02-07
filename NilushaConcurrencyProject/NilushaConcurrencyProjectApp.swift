//
//  NilushaConcurrencyProjectApp.swift
//  NilushaConcurrencyProject
//
//  Created by Nilusha Niwanthaka Wimalasena on 3/2/24.
//

import SwiftUI

@main
struct NilushaConcurrencyProjectApp: App {
    
    // register app delegate for Firebase setup
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            FirstView()
        }
    }
}
