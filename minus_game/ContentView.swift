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
    @ObservedObject var viewModel = UsersViewModel()
    
    
    var body: some View {
        ZStack {
            mainBackground
                .ignoresSafeArea(.all)
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.users, id: \.self) { user in
                        MainCardView(user: user)
                            .onTapGesture {
                            }
                           
                    }
                    
                    
                }
                .padding(.horizontal, 16)
                
            }
        }
        .onAppear() {
                self.viewModel.fetchData()
              }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static let userFake = UserModel(
        id: "",
        name: "Hein",
        emoji: "🇳🇴",
        score: -122,
        joined: "06/17"
)
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
