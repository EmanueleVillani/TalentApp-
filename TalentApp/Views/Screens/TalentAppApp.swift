//
//  TalentAppApp.swift
//  TalentApp
//
//  Created by Emanuele Villani on 17/04/2021.
//

import SwiftUI
import FirebaseCore
import Firebase

@main
struct TalentAppApp: App {
    
    init() {
        FirebaseApp.configure()
      
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
