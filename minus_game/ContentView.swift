//
//  ContentView.swift
//  minus_game
//
//  Created by David Vickhoff on 2021-01-15.
//

import SwiftUI

struct ContentView: View {
    let users: [User] = Bundle.main.decode("users.json")
    @State var isShowingDetails = false
    @State var isExpanded: [Bool] = [false, false, false, false, false, false, false, false, false, false]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(users.indices, id: \.self) { index in


                    MainCardView(user: users[index], isShowingDetails: $isExpanded[index])
                        .onTapGesture {
                            for i in isExpanded.indices {
                                isExpanded[i] = false
                            }
                            isExpanded[index] = true
                        }
                        .animation(.spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0))

                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
