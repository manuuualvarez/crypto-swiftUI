import SwiftUI

struct CircleButtonAnimationView: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
        CircleButtonAnimationView()
}