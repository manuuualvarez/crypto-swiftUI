//
//  CircleButtonAnimationView.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 01/08/2025.
//


import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? .easeOut(duration: 1.0) : .none, value: animate)

    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CircleButtonAnimationView(animate: .constant(false))
        .frame(width: 200, height: 200)
}
