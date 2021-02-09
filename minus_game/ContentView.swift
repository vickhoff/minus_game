//
//  ContentView.swift
//  minus_game
//
//  Created by David Vickhoff on 2021-01-15.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore




struct ContentView: View {
    @StateObject var viewModel = UsersViewModel()
    

    
    
    var body: some View {
        ZStack {
            mainBackground
                .ignoresSafeArea(.all)
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.users, id: \.self) { user in
                        MainCardView(user: user)
                    }
                    
                }
                .padding(.horizontal, 16)
                
            }
        }

    }
    
    
}

struct ContentView_Previews: PreviewProvider {
//    static let userTest: [UsersViewModel] = [
//        UserModel(
//            id: "0",
//            name: "Ben",
//            emoji: "🇺🇸",
//            score: -43,
//            joined: "06/17",
//            highest: 11,
//            lowest: -999,
//            avgPrWeek: -0.66,
//            aboveZero: 6,
//            belowZero: 452
//        ),
//        UserModel(
//            id: "1",
//            name: "Ben",
//            emoji: "🇺🇸",
//            score: -43,
//            joined: "06/17",
//            highest: 11,
//            lowest: -999,
//            avgPrWeek: -0.66,
//            aboveZero: 6,
//            belowZero: 452
//        )
//    ]
    static var previews: some View {
        ContentView(viewModel: UsersViewModel())
            .preferredColorScheme(.light)
            
    }
}
