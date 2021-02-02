//
//  LaunchScreenView.swift
//  minus_game
//
//  Created by David Vickhoff on 2021-01-31.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @State var hasAppeared = false
    
    var body: some View {
        ZStack {
            redLight
            Image("line")
                //.fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 180, height: 60, alignment: .center)
                .edgesIgnoringSafeArea(.all)
                .offset(x: hasAppeared ? 375 : -375)
                .animation(Animation.timingCurve(0, 0.89, 0.99, 0.09, duration: 1).delay(1.0).repeatForever(autoreverses: false))
                .onAppear(perform: {
                    hasAppeared = true
                })
        }
        //.frame(width: .infinity)
        .edgesIgnoringSafeArea(.all)

    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
