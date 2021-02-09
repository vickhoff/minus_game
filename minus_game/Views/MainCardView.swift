//
//  MainCardView.swift
//  Minusgame
//
//  Created by David Vickhoff on 2021-01-14.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

struct MainCardView: View {
    @ObservedObject var viewModel = UsersViewModel()
    
    @State var user: UserModel
    @State var animateScore = false
    @State var isShowingDetails: Bool = false
    var haptic = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                HStack(spacing: 16) {
                        Text(user.emoji)
                        Text(user.name)
                            .font(fontTitle2)
                    Spacer()
                        Text("\(user.score)")
                            .font(fontTitle2)
                            .multilineTextAlignment(.center)
                            .scaleEffect(animateScore ? 1.5 : 1)
                            
                        Text("(23)")
                            .font(fontCaption)
                    
                }
                .onTapGesture {
                    self.isShowingDetails.toggle()
                }
                HStack {
                    Text("joined \(user.joined)")
                        .font(fontCaption)
                        .foregroundColor(.gray)
                    Spacer()
                        
                        //MARK: BUTTON +
                        Button(action:{
                            scoreAnimation()
                            viewModel.givePlus(user: self.user)
                            haptic.impactOccurred()
                        }, label: {
                            Image("plus")
                            
                            
                        })
                        .frame(width: 56, height: 40)
                        .background(greenLight)
                        .cornerRadius(8)
                        
                        //MARK: BUTTON -
                        Button(action:{
                            scoreAnimation()
                            viewModel.giveMinus(user: self.user)
                            haptic.impactOccurred()
                        }, label: {
                            Image("minus")
                            
                            
                        })
                        .frame(width: 56, height: 40)
                        .background(redLight)
                        .cornerRadius(8)
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
        .animation(.spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0))
        
        }
        
    
    //MARK: FUNCTIONS

    func scoreAnimation(){
        animateScore = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            animateScore = false
        }
    }
   
    
}

struct MainCardView_Previews: PreviewProvider {
    static let user = UserModel(
        id: "0",
        userID: "",
        name: "Ben",
        emoji: "🇺🇸",
        score: -42,
        joined: "06/17",
        highest: 11,
        lowest: -999,
        avgPrWeek: -0.66,
        aboveZero: 6,
        belowZero: 452
)
    static var previews: some View {
        MainCardView(user: user)
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
    }
}

