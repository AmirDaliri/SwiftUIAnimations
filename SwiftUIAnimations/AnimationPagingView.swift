//
//  AnimationPagingView.swift
//  SwiftUIAnimations
//
//  Created by Amir Daliri on 11.11.2024.
//

import SwiftUI

struct AnimationPagingView: View {
    var body: some View {
        TabView {
            SwirlingGalaxyView()
                .tabItemLabel("Pulsating Fractal")
            
            HypnoticSpiralView()
                .tabItemLabel("3D Rotating Sphere")
            
            MorphingFlowerView()
                .tabItemLabel("Morphing Flower")
            
            MorphingGeometricAnimationView()
                .tabItemLabel("Morphing Geometric Shape")
            
            PulsatingFractalViewContentView()
                .tabItemLabel("PulsatingFractalView")
            
            InteractiveParticleWaveView()
                .tabItemLabel("Interactive Particle Wave")
            
            // Add other animations here in the same way
        }.ignoresSafeArea(.all)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

extension View {
    /// Custom modifier for adding labels to each tab item
    func tabItemLabel(_ title: String) -> some View {
        self
            .overlay(
                VStack {
                    Text(title)
                        .foregroundColor(.white)
                        .font(.caption)
                        .padding(.bottom, 8)
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(8)
                }
                .padding(.top, 20),
                alignment: .top
            )
    }
}

struct AnimationPagingView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPagingView()
    }
}
