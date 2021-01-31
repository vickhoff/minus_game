//
//  ButtonView.swift
//  Minusgame
//
//  Created by David Vickhoff on 2021-01-14.
//

import SwiftUI



struct ButtonView: View {
    var icon: String
    var color: Color
    var haptic = UIImpactFeedbackGenerator(style: .rigid)
    
    var body: some View {
        Button(action:{

                haptic.impactOccurred()
        }, label: {
            Image(icon)
                
                
        })
        .frame(width: 56, height: 40)
        .background(color)
        .cornerRadius(8)

    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(icon: "plus", color: greenLight)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
