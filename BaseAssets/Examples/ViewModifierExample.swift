//
//  ContentView.swift
//  TrainingProject
//
//  Created by Guilherme - ília on 26/01/22.
//

import SwiftUI

// Create a view modifier
struct DefaultViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

// Extends the view to call the modifier in the view as a singleton
extension View {
    func withDefaultViewModifier(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultViewModifier(backgroundColor: backgroundColor))
    }
}


struct ViewModifierExample: View {
    var body: some View {
        Text("Hello, world!")
            .font(.headline)
            .withDefaultViewModifier(backgroundColor: .pink) // Calls the view modifier
    }
}

struct ViewModifierExample_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierExample()
            .previewDevice("iPhone 13")
    }
}
