//
//  ContentView.swift
//  minus_game
//
//  Created by David Vickhoff on 2021-01-15.
//

import SwiftUI
import Firebase
import FirebaseDatabase



struct ContentView: View {
    @State var users: UserArrayObject
    
    var ref: DatabaseReference! = Database.database().reference()
    
    var body: some View {
        ZStack {
            mainBackground
                .ignoresSafeArea(.all)
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(users.dataArray, id: \.self) { user in
                        MainCardView(user: user)
                            .onTapGesture {
                                self.ref.child("users").child(user.id).setValue(["name": user.name])
                            }
                    }
                    
                    
                }
                .padding(.horizontal, 16)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(users: UserArrayObject())
            .preferredColorScheme(.light)
    }
}
