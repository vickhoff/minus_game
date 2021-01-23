//
//  DetailView.swift
//  minus_game
//
//  Created by David Vickhoff on 2021-01-17.
//

import SwiftUI

struct DetailView: View {
    let user: User
    @State private var showingAlert = false
    
    var body: some View {
        
        VStack(spacing: 16) {
            Divider()
            VStack(spacing: 32) {
                VStack(spacing: 16) {
                    HStack {
                        HStack {
                            Circle()
                                .fill(greenLight)
                                .frame(width: 40, height: 40)
                                .overlay(Image("highest"))
                            Text("Highest")
                                .font(fontRegular)
                        }
                        Spacer()
                        Text("+11")
                            .font(fontTitle2)
                        
                    }
                    
                    HStack {
                        HStack {
                            Circle()
                                .fill(redLight)
                                .frame(width: 40, height: 40)
                                .overlay(Image("lowest"))
                            Text("Lowest")
                                .font(fontRegular)
                        }
                        Spacer()
                        Text("-999")
                            .font(fontTitle2)
                        
                    }
                    
                    HStack {
                        HStack {
                            Circle()
                                .fill(yellowLight)
                                .frame(width: 40, height: 40)
                                .overlay(Image("average"))
                            Text("Avg. per week")
                                .font(fontRegular)
                        }
                        Spacer()
                        Text("-0,66")
                            .font(fontTitle2)
                        
                    }
                    
                    HStack {
                        HStack {
                            Circle()
                                .fill(greenLight)
                                .frame(width: 40, height: 40)
                                .overlay(Image("above-0"))
                            Text("Above 0")
                                .font(fontRegular)
                        }
                        Spacer()
                        Text("6 days")
                            .font(fontTitle2)
                        
                    }
                    
                    HStack {
                        HStack {
                            Circle()
                                .fill(redLight)
                                .frame(width: 40, height: 40)
                                .overlay(Image("below-0"))
                            Text("Below 0")
                                .font(fontRegular)
                        }
                        Spacer()
                        Text("452 days")
                            .font(fontTitle2)
                        
                    }
                }
                .foregroundColor(textColor)
                Button(action: {
                    self.showingAlert = true
                }, label: {
                    HStack {
                        Spacer()
                        Image("delete")
                        Spacer()
                    }
                })
                .padding(.vertical, 8)
                .background(redLight)
                .cornerRadius(8)
                .alert(isPresented:$showingAlert) {
                    Alert(title: Text("Är du säker på att du vill ta bort \(user.name)?"), message: Text("Hen kommer flyttas till steg 2"), primaryButton: .destructive(Text("Ta bort jäveln")), secondaryButton: .cancel(Text("Nah")))
                }
                
                
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
    }
    
}


struct DetailView_Previews: PreviewProvider {
    static let users: [User] = Bundle.main.decode("users.json")
    
    static var previews: some View {
        DetailView(user:users[0])
            .previewLayout(.sizeThatFits)
        //.padding()
    }
}
