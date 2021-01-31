//
//  MainCardView.swift
//  Minusgame
//
//  Created by David Vickhoff on 2021-01-14.
//

import SwiftUI

struct MainCardView: View {
    
    @State var user: UserModel
    @Binding var isShowingDetails: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            VStack{
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
            if isShowingDetails {
                DetailView(user: user)
            }
        }
        .background(cardBackground)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 8)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct MainCardView_Previews: PreviewProvider {
    static let user = UserModel(name: "Hein", emoji: "🇳🇴", score: -122, joined: "06/17", meta: [MetaModel(highest: 5, lowest: -133, avgPrWeek: -0.66, aboveZero: 6, belowZero: 44)])
    
    static var previews: some View {
        MainCardView(user: user, isShowingDetails: .constant(true))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
