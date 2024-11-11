//
//  MorphingGeometricAnimationView.swift
//  SwiftUIAnimations
//
//  Created by Amir Daliri on 11.11.2024.
//

import SwiftUI

struct MorphingShape: Shape {
    var progress: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        let offset = width * progress * 0.5
        
        path.move(to: CGPoint(x: width / 2, y: 0 + offset))
        path.addLine(to: CGPoint(x: width - offset, y: height / 3))
        path.addLine(to: CGPoint(x: width / 2, y: height - offset))
        path.addLine(to: CGPoint(x: 0 + offset, y: height / 3))
        path.closeSubpath()
        
        return path
    }
}

struct MorphingGeometricAnimationView: View {
    @State private var progress: CGFloat = 0.5
    @State private var rotation: Angle = .degrees(0)
    @State private var color = Color.blue
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            MorphingShape(progress: progress)
                .stroke(LinearGradient(
                    gradient: Gradient(colors: [color, color.opacity(0.7), color.opacity(0.3)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing),
                    lineWidth: 5)
                .frame(width: 200, height: 200)
                .rotationEffect(rotation)
                .scaleEffect(1.2)
                .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true), value: progress)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                        rotation = .degrees(360)
                    }
                }
                .gesture(DragGesture()
                    .onChanged { gesture in
                        let dragAmount = min(max(gesture.translation.width / 200, 0), 1)
                        progress = dragAmount
                        color = Color(hue: Double(dragAmount), saturation: 1, brightness: 1)
                    }
                )
        }
    }
}

struct MorphingGeometricAnimationViewContentView: View {
    var body: some View {
        MorphingGeometricAnimationView()
    }
}

struct MorphingGeometricAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MorphingGeometricAnimationViewContentView()
    }
}
