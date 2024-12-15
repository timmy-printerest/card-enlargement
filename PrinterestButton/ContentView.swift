import SwiftUI

struct ContentView: View {

    @State private var isHovered = false
    @State private var isAnimated = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            animatedCard
            cardText
        }
        .onTapGesture {
            isHovered.toggle()
        }
        .onAppear {
            isAnimated = true
        }
    }
    private var animatedCard: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [isAnimated ? .blue : .purple, isAnimated ? .green : .orange]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 250, height: 200)
            .scaleEffect(isHovered ? 1.3 : 1.0)
            .brightness(isHovered ? -0.1 : 0.0)
            .shadow(
                color: isHovered ? .blue.opacity(0.7) : .clear,
                radius: 20
            )
            .animation(.easeInOut(duration: 0.3), value: isHovered)
            .animation(.easeInOut(duration: 3).repeatForever(autoreverses: true), value: isAnimated)
    }
    
    private var cardText: some View {
        Text("Press to me")
            .font(.headline)
            .foregroundColor(.white)
            .rotationEffect(.degrees(isHovered ? 5 : 0))
            .animation(.easeInOut(duration: 0.3), value: isHovered)
    }
}

#Preview {
    ContentView()
}
