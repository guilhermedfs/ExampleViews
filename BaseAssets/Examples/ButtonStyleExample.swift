//
//  ButtonStyleExample.swift
//  BaseAssets
//
//  Created by Guilherme - ília on 26/01/22.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaleAmount: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleAmount : 1.0)
//            .brightness(configuration.isPressed ? 0.1 : 0)
//            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

extension View {
    /// Make an animation of the button based on the value that is passed. If default(empty), the scale amount will be 0.9.
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaleAmount: scaledAmount))
    }
}

struct ButtonStyleExample: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click Me")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(10)
                .shadow(color: .blue.opacity(0.3), radius: 10, x: 0.3, y: 10)
        }
        .withPressableStyle(scaledAmount: 1.2)
        .padding(40)
    }
}

struct ButtonStyleExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleExample()
    }
}
