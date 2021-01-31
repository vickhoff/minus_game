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
    var haptic = UIImpactFeedbackGenerator(style: .rigid)
    
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
                    
                    //MARK: BUTTON +
                    Button(action:{

                            haptic.impactOccurred()
                    }, label: {
                        Image("plus")
                            
                            
                    })
                    .frame(width: 56, height: 40)
                    .background(greenLight)
                    .cornerRadius(8)
                    
                    //MARK: BUTTON -
                    Button(action:{

                            haptic.impactOccurred()
                    }, label: {
                        Image("minus")
                            
                            
                    })
                    .frame(width: 56, height: 40)
                    .background(redLight)
                    .cornerRadius(8)
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
    
    //MARK: FUNCTIONS
    
    func givePlus() {
        
        // Update local data
        //let updatedUser = UserModel(userID: user.userID, name: user.name, emoji: user.emoji, score: user.score, joined: user.joined, meta: [MetaModel(metaID: meta.metaID, highest: meta.highest, lowest: meta.lowest, avgPrWeek: meta.avgPrWeek)])
        //self.user = updatedUser
        
    }
}

struct MainCardView_Previews: PreviewProvider {
    static let user = UserModel(userID: "", name: "Hein", emoji: "🇳🇴", score: -122, joined: "06/17", meta: [MetaModel(metaID: "", highest: 5, lowest: -133, avgPrWeek: -0.66, aboveZero: 6, belowZero: 44)])
    static var previews: some View {
        MainCardView(user: user, isShowingDetails: .constant(true))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
