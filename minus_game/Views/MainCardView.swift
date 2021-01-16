//
//  MainCardView.swift
//  Minusgame
//
//  Created by David Vickhoff on 2021-01-14.
//

import SwiftUI

struct MainCardView: View {
    
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                HStack(spacing: 16) {
                    Text(user.emoji)
                    Text(user.name)
                        .font(fontTitle2)
                }
                Spacer()
                HStack {
                    Text("\(user.score)")
                        .font(fontTitle2)
                    Text("(23)")
                        .font(fontCaption)
                }
                
            }
            HStack {
                Text("joined \(user.joined)")
                    .font(fontCaption)
                    .foregroundColor(.gray)
                Spacer()
                HStack(spacing: 8) {
                    ButtonView(icon: "plus", color: greenLight)
                    ButtonView(icon: "minus", color: redLight)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
    }
}

struct MainCardView_Previews: PreviewProvider {
    static let users: [User] = Bundle.main.decode("users.json")
    
    static var previews: some View {
        MainCardView(user: users[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
