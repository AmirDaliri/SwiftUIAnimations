//
//  BreathingCirclesView.swift
//  Real-Time Data Processing
//
//  Created by Amir Daliri on 11.11.2024.
//

import SwiftUI

struct BreathingCirclesView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [.blue, .purple, .pink]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            // Layered circles with animations
            ForEach(0..<6) { index in
                Circle()
                    .strokeBorder(AngularGradient(
                        gradient: Gradient(colors: [.cyan, .blue, .purple, .cyan]),
                        center: .center
                    ), lineWidth: 10)
                    .frame(width: CGFloat(150 + index * 30),
                           height: CGFloat(150 + index * 30))
                    .scaleEffect(animate ? 1.2 : 0.8)
                    .rotationEffect(.degrees(animate ? 360 : 0))
                    .opacity(animate ? 0.7 : 0.3)
                    .animation(
                        Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: true)
                            .delay(Double(index) * 0.3),
                        value: animate
                    )
            }
        }
        .onAppear {
            animate.toggle()
        }
    }
}

struct ContentView: View {
    var body: some View {
        BreathingCirclesView()
    }
}

struct BreathingCirclesView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
