//
//  GalaxyView.swift
//  SwiftUIAnimations
//
//  Created by Amir Daliri on 11.11.2024.
//

import SwiftUI

struct GalaxyParticle: Identifiable {
    let id = UUID()
    var angle: Double
    var radius: Double
    var color: Color
    var size: CGFloat
    var speed: Double
}

struct SwirlingGalaxyView: View {
    @State private var particles: [GalaxyParticle] = []
    @State private var animate = false
    
    let colors: [Color] = [.blue, .purple, .pink, .cyan, .yellow, .white]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ForEach(particles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: particle.size, height: particle.size)
                    .offset(x: CGFloat(cos(particle.angle) * particle.radius),
                            y: CGFloat(sin(particle.angle) * particle.radius))
                    .rotationEffect(.degrees(animate ? 360 : 0))
                    .scaleEffect(animate ? 1.5 : 0.7)
                    .animation(
                        Animation.linear(duration: particle.speed).repeatForever(autoreverses: true),
                        value: animate
                    )
                    .onAppear {
                        animate = true
                    }
            }
        }
        .onAppear {
            generateParticles()
        }
    }
    
    func generateParticles() {
        particles = (0..<150).map { _ in
            let angle = Double.random(in: 0..<2 * .pi)
            let radius = Double.random(in: 50...200)
            return GalaxyParticle(
                angle: angle,
                radius: radius,
                color: colors.randomElement()!,
                size: CGFloat.random(in: 3...8),
                speed: Double.random(in: 3...7)
            )
        }
    }
}

struct GalaxyViewContentView: View {
    var body: some View {
        SwirlingGalaxyView()
    }
}

struct GalaxyView_Previews: PreviewProvider {
    static var previews: some View {
        GalaxyViewContentView()
    }
}
