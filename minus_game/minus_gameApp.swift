//
//  minus_gameApp.swift
//  minus_game
//
//  Created by David Vickhoff on 2021-01-15.
//

import SwiftUI
import Firebase

@main
struct minus_gameApp: App {
    @StateObject var viewModel = UsersViewModel()

    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
