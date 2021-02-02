//
//  MainCardView.swift
//  Minusgame
//
//  Created by David Vickhoff on 2021-01-14.
//

import SwiftUI
import Firebase
import FirebaseDatabase

struct MainCardView: View {
    
    var ref: DatabaseReference! = Database.database().reference()
    
    @State var user: UserModel
    @State var animateScore = false
    @State var isShowingDetails: Bool = false
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
                            .multilineTextAlignment(.center)
                            .scaleEffect(animateScore ? 1.5 : 1)
                            
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
                            givePlus()
                            haptic.impactOccurred()
                        }, label: {
                            Image("plus")
                            
                            
                        })
                        .frame(width: 56, height: 40)
                        .background(greenLight)
                        .cornerRadius(8)
                        
                        //MARK: BUTTON -
                        Button(action:{
                            giveMinus()
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
            .onTapGesture {
                self.isShowingDetails.toggle()
            }
            if isShowingDetails {
                DetailView(user: user)
            }
        }
        .background(cardBackground)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 8)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
        .animation(.spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0))
    }
    
    //MARK: FUNCTIONS
    func givePlus(){
        self.ref.child("users/\(user.id)/score").setValue(user.score + 1)
    }
    /*func givePlus() {
        // Update local data
        let updatedUser = UserModel(userID: user.userID, name: user.name, emoji: user.emoji, score: user.score + 1, joined: user.joined, meta: MetaModel(metaID: user.meta.metaID, highest: user.meta.highest, lowest: user.meta.lowest, avgPrWeek: user.meta.avgPrWeek))
        self.user = updatedUser
        
        animateScore = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            animateScore = false
        }
        
    }*/
    
    func giveMinus() {
        // Update local data
        let updatedUser = UserModel(id: user.id, userID: user.userID, name: user.name, emoji: user.emoji, score: user.score - 1, joined: user.joined, meta: MetaModel(id: user.meta.id, metaID: user.meta.metaID, highest: user.meta.highest, lowest: user.meta.lowest, avgPrWeek: user.meta.avgPrWeek))
        self.user = updatedUser
        
        animateScore = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            animateScore = false
        }
        
        
        
    }
}

struct MainCardView_Previews: PreviewProvider {
    static let user = UserModel(
        id: "",
        userID: "",
        name: "Hein",
        emoji: "🇳🇴",
        score: -122,
        joined: "06/17",
        meta: MetaModel(
            id: "",
            metaID: "",
            highest: 5,
            lowest: -133,
            avgPrWeek: -0.66,
            aboveZero: 1,
            belowZero: 44
        ))
    static var previews: some View {
        MainCardView(user: user)
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
    }
}

