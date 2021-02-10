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
    @State private var isShowingDetails: Bool = false
    var scores = [Int]()


    
    
    var body: some View {
        ZStack {
            mainBackground
                .ignoresSafeArea(.all)
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.users, id: \.self) { user in
                        MainCardView(user: user, isShowingDetails: $isShowingDetails)
                            .onTapGesture {
                                self.isShowingDetails.toggle()
                            }
                            .animation(.spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0))
                    }
                    
                    
                }
                .padding(.horizontal, 16)

                
            }
        }

    }
    

    
    
    
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView(viewModel: UsersViewModel())
            .preferredColorScheme(.light)
            
    }
}
