//
//  InteractiveParticleWaveView.swift
//  SwiftUIAnimations
//
//  Created by Amir Daliri on 11.11.2024.
//

import SwiftUI

struct Particle: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    var size: CGFloat
    var color: Color
}

struct InteractiveParticleWaveView: View {
    @State private var particles: [Particle] = []
    @State private var animate = false
    @State private var touchLocation = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
    
    let colors: [Color] = [.blue, .purple, .cyan, .pink, .orange, .yellow]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            // Particles layer
            ForEach(particles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: particle.size, height: particle.size)
                    .position(x: particle.x, y: particle.y)
                    .opacity(animate ? 0.8 : 0.3)
                    .scaleEffect(animate ? 1.5 : 0.5)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animate)
            }
        }
        .gesture(DragGesture()
            .onChanged { gesture in
                touchLocation = gesture.location
                generateParticles(at: touchLocation)
            }
        )
        .onAppear {
            animate = true
            generateParticles(at: touchLocation)
        }
    }
    
    func generateParticles(at location: CGPoint) {
        particles = (0..<100).map { _ in
            Particle(
                x: location.x + CGFloat.random(in: -100...100),
                y: location.y + CGFloat.random(in: -100...100),
                size: CGFloat.random(in: 4...8),
                color: colors.randomElement()!
            )
        }
    }
}

struct InteractiveParticleWaveViewContentView: View {
    var body: some View {
        InteractiveParticleWaveView()
    }
}

struct InteractiveParticleWaveView_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveParticleWaveViewContentView()
    }
}
