//
//  CustomShapeExample.swift
//  BaseAssets
//
//  Created by Guilherme - ília on 27/01/22.
//

import SwiftUI

struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Octagono: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX/2, y: rect.minY))
            path.addLine(to: CGPoint(x: (rect.maxX - rect.midX/2), y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY/2))
            path.addLine(to: CGPoint(x: rect.maxX, y: (rect.maxY - rect.midY/2)))
            path.addLine(to: CGPoint(x: (rect.maxX - rect.midX/2), y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX/2, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: (rect.maxY - rect.midY/2)))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY/2))
            path.addLine(to: CGPoint(x: rect.midX/2, y: rect.minY))
        }
    }
}

struct CustomShapeExample: View {
    var body: some View {
        ZStack {
            Octagono()
                .frame(width: 300, height: 300)
        }
    }
}

struct CustomShapeExample_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapeExample()
    }
}
