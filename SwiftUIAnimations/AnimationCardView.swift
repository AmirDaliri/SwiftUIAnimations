//
//  AnimationCardView.swift
//  SwiftUIAnimations
//
//  Created by Amir Daliri on 11.11.2024.
//

import SwiftUI

struct AnimationCardView: View {
    let title: String
    let animationView: AnyView
    
    var body: some View {
        VStack {
            animationView
                .frame(height: 200) // Set the height for each card
                .cornerRadius(12)
                .shadow(radius: 5)
                .overlay(
                    Text(title)
                        .foregroundColor(.white)
                        .font(.caption)
                        .padding(6)
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(8),
                    alignment: .bottomTrailing
                )
        }
        .padding()
    }
}

struct AnimationCollectionView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                AnimationCardView(title: "Swirling Galaxy", animationView: AnyView(SwirlingGalaxyView()))
                AnimationCardView(title: "Hypnotic Spiral", animationView: AnyView(HypnoticSpiralView()))
                AnimationCardView(title: "Morphing Flower", animationView: AnyView(MorphingFlowerView()))
                AnimationCardView(title: "Morphing Geometric Shape", animationView: AnyView(MorphingGeometricAnimationView()))
                AnimationCardView(title: "Pulsating Fractal", animationView: AnyView(PulsatingFractalViewContentView()))
                AnimationCardView(title: "Interactive Particle Wave", animationView: AnyView(InteractiveParticleWaveView()))
            }
            .padding(.horizontal)
        }
        .background(Color.black.ignoresSafeArea())
    }
}

struct AnimationCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationCollectionView()
    }
}
