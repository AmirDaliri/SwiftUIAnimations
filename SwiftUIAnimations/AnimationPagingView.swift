//
//  AnimationPagingView.swift
//  SwiftUIAnimations
//
//  Created by Amir Daliri on 11.11.2024.
//

import SwiftUI

struct AnimationPagingView: View {
    @State private var selectedTab = 0
    private let tabCount = 6 // Update this count if you add more views

    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<tabCount) { index in
                    getView(for: index)
                        .offset(x: CGFloat(index - selectedTab) * UIScreen.main.bounds.width)
                        .animation(.easeInOut, value: selectedTab)
                        .frame(width: UIScreen.main.bounds.width)
                }
            }
            .ignoresSafeArea(.all)

            // "Next" button
            Button("Next") {
                selectedTab = (selectedTab + 1) % tabCount
            }
            .padding()
        }
        .background(.black)
    }

    // Function to return each animation view based on index
    @ViewBuilder
    func getView(for index: Int) -> some View {
        switch index {
        case 0:
            SwirlingGalaxyView()
        case 1:
            HypnoticSpiralView()
        case 2:
            BreathingCirclesView()
        case 3:
            MorphingFlowerView()
        case 4:
            MorphingGeometricAnimationView()
        case 5:
            InteractiveParticleWaveView()
        default:
            EmptyView()
        }
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
