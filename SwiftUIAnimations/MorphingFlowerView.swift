//
//  ParticleExplosionView.swift
//  SwiftUIAnimations
//
//  Created by Amir Daliri on 11.11.2024.
//

import SwiftUI

struct MorphingFlowerView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea() // Background color
            
            // Repeating flower petals with rotation and scaling animations
            ForEach(0..<12) { i in
                Circle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple, Color.pink, Color.cyan]),
                                       startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100)
                    .offset(x: animate ? 130 : 60, y: animate ? 130 : 60)
                    .rotationEffect(.degrees(Double(i) * 30))
                    .scaleEffect(animate ? 1.2 : 0.7)
                    .rotationEffect(animate ? .degrees(360) : .degrees(0))
                    .opacity(0.8)
                    .blendMode(.plusLighter)
                    .animation(
                        Animation.easeInOut(duration: 5)
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

struct MorphingFlowerViewContentView: View {
    var body: some View {
        MorphingFlowerView()
    }
}

struct MorphingFlowerView_Previews: PreviewProvider {
    static var previews: some View {
        MorphingFlowerViewContentView()
    }
}
