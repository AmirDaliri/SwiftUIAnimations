//
//  HypnoticSpiralView.swift
//  SwiftUIAnimations
//
//  Created by Amir Daliri on 11.11.2024.
//

import SwiftUI

struct HypnoticSpiralView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea() // Background color
            
            // Creating spiral layers
            ForEach(0..<36) { i in
                Circle()
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [Color.red, Color.orange, Color.yellow, Color.purple, Color.blue]),
                                       center: .center, startRadius: 5, endRadius: 50)
                    )
                    .frame(width: CGFloat(animate ? 20 + i * 4 : 10 + i * 2),
                           height: CGFloat(animate ? 20 + i * 4 : 10 + i * 2))
                    .offset(x: animate ? CGFloat(i * 8) : CGFloat(i * 4),
                            y: animate ? CGFloat(i * 8) : CGFloat(i * 4))
                    .rotationEffect(.degrees(animate ? Double(i) * 10 : Double(i) * 5))
                    .opacity(Double(36 - i) / 36.0)
                    .blendMode(.plusLighter)
                    .animation(
                        Animation.easeInOut(duration: 8)
                            .repeatForever(autoreverses: true)
                            .delay(Double(i) * 0.1),
                        value: animate
                    )
            }
        }
        .onAppear {
            animate = true
        }
    }
}

struct HypnoticSpiralViewContentView: View {
    var body: some View {
        HypnoticSpiralView()
    }
}

struct HypnoticSpiralView_Previews: PreviewProvider {
    static var previews: some View {
        HypnoticSpiralViewContentView()
    }
}
