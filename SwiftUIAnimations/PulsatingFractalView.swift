//
//  PulsatingFractalView.swift
//  SwiftUIAnimations
//
//  Created by Amir Daliri on 11.11.2024.
//

import SwiftUI

struct FractalLayer: Identifiable {
    let id = UUID()
    var size: CGFloat
    var color: Color
    var rotation: Double
    var speed: Double
}

struct PulsatingFractalView: View {
    @State private var animate = false
    @State private var layers: [FractalLayer] = []
    
    let colors: [Color] = [.purple, .blue, .pink, .cyan, .orange]
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect() // Trigger state change

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ForEach(layers) { layer in
                Circle()
                    .stroke(layer.color, lineWidth: 2)
                    .frame(width: layer.size, height: layer.size)
                    .scaleEffect(animate ? 1.2 : 0.8)
                    .rotationEffect(.degrees(animate ? layer.rotation : 0))
                    .opacity(0.7)
                    .blendMode(.plusLighter)
                    .animation(
                        Animation.easeInOut(duration: layer.speed)
                            .repeatForever(autoreverses: true)
                            .delay(Double(layer.size) * 0.02), // Stagger animation start time
                        value: animate
                    )
            }
        }
        .onAppear {
            generateLayers()
            animate.toggle() // Initial toggle to start the animation
        }
        .onReceive(timer) { _ in
            animate.toggle() // Update `animate` state every 0.1 seconds to keep animation running
        }
    }
    
    func generateLayers() {
        layers = (0..<8).map { i in
            let size = CGFloat(100 + i * 40)
            return FractalLayer(
                size: size,
                color: colors[i % colors.count],
                rotation: Double(i * 45),
                speed: Double.random(in: 2.5...4.5) // Adjust speed for smoother effect
            )
        }
    }
}

struct PulsatingFractalViewContentView: View {
    var body: some View {
        PulsatingFractalView()
    }
}

struct PulsatingFractalView_Previews: PreviewProvider {
    static var previews: some View {
        PulsatingFractalViewContentView()
    }
}
