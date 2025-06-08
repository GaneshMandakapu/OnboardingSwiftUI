import SwiftUI

// MARK: - Onboarding Step Model
struct OnboardingStep {
    let imageName: String
    let iconName: String
    let welcomeText: String
    let mainTitle: String
    let description: String
    let buttonText: String
    let gradientColors: [Color]
}

// MARK: - ContentView
struct ContentView: View {
    @State private var onboardingStep: Int = 0
    
    let steps: [OnboardingStep] = [
        OnboardingStep(
            imageName: "1",
            iconName: "pencil.and.outline",
            welcomeText: "Discover Your Notes",
            mainTitle: "Get Organized",
            description: "Take notes anytime and capture your ideas on the go.",
            buttonText: "Continue",
            gradientColors: [.orange, .red]
        ),
        OnboardingStep(
            imageName: "2",
            iconName: "pencil.and.scribble",
            welcomeText: "Stay Productive",
            mainTitle: "Your Ideas, Saved",
            description: "Never forget anything important—save, sync, and revisit notes from any device.",
            buttonText: "Continue",
            gradientColors: [.blue, .purple]
        ),
        OnboardingStep(
            imageName: "3",
            iconName: "book",
            welcomeText: "Stay Organized",
            mainTitle: "All in One Place",
            description: "Organize your notes with folders, tags, and color coding.",
            buttonText: "Continue",
            gradientColors: [.green, .mint]
        ),
        OnboardingStep(
            imageName: "4",
            iconName: "sparkles",
            welcomeText: "You're Ready!",
            mainTitle: "Let's Get Started",
            description: "Finish setup and start using the app right away.",
            buttonText: "Get Started",
            gradientColors: [.indigo, .cyan]
        )
    ]
    
    var currentStepData: OnboardingStep? {
        onboardingStep > 0 ? steps[onboardingStep - 1] : nil
    }
    
    var currentGradientColors: [Color] {
        onboardingStep == 0 ? [.orange, .red] : (currentStepData?.gradientColors ?? [.black, .gray])
    }
    
    var currentImageName: String {
        onboardingStep == 0 ? "1" : (currentStepData?.imageName ?? "1")
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: currentGradientColors),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                // Background image (optional: replace with your own)
                Image(currentImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .ignoresSafeArea()
                    .overlay(Color.black.opacity(0.4))
                
                // Back button (circular)
                if onboardingStep > 1 {
                    HStack {
                        Button(action: {
                            withAnimation {
                                onboardingStep = 1
                            }
                        }) {
                            Image(systemName: "arrow.backward.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.white.opacity(0.85))
                        }
                        .padding(.leading, 20)
                        .padding(.top, 50)
                        
                        Spacer()
                    }
                }
                
                // Main content
                VStack(spacing: 20) {
                    Image(systemName: onboardingStep == 0 ? "pencil.and.outline" : (currentStepData?.iconName ?? "pencil"))
                        .font(.system(size: 50))
                        .foregroundColor(.white.opacity(0.8))
                    
                    Group {
                        if onboardingStep == 0 {
                            Text("Welcome")
                                .font(.system(size: 18))
                            
                            Text("Your Notes, Your Way")
                                .font(.system(size: 35))
                                .bold()
                            
                            Text("No matter where you are, you can take notes, save them, and edit them whenever you need. Turn your thoughts into written words.")
                                .font(.system(size: 18))
                                .padding(.horizontal, 24)
                                .multilineTextAlignment(.center)
                            
                            Text("Start the setup in 4 simple steps.")
                                .font(.system(size: 18))
                        } else if let step = currentStepData {
                            Text(step.welcomeText)
                                .font(.system(size: 18))
                            
                            Text(step.mainTitle)
                                .font(.system(size: 35))
                                .bold()
                            
                            Text(step.description)
                                .font(.system(size: 18))
                                .padding(.horizontal, 24)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .foregroundColor(.white.opacity(0.85))
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                    .id(onboardingStep)
                    
                    Spacer()
                    
                    // Progress indicators
                    HStack(spacing: 8) {
                        ForEach(0..<steps.count, id: \.self) { number in
                            Capsule()
                                .frame(width: 40, height: 10)
                                .foregroundColor(onboardingStep - 1 >= number ? Color.orange : Color.gray.opacity(0.5))
                        }
                    }
                    .padding(.top, 40)
                    
                    // Continue button
                    Button(action: {
                        withAnimation(.easeInOut) {
                            if onboardingStep < steps.count {
                                onboardingStep += 1
                            } else {
                                // Onboarding complete
                            }
                        }
                    }) {
                        HStack {
                            Text(onboardingStep == 0 ? "Let's Start" : (currentStepData?.buttonText ?? "Continue"))
                                .font(.system(size: 18))
                            Image(systemName: "arrow.right")
                        }
                        .padding()
                        .frame(width: 280, height: 50)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    }
                    .padding(.bottom,5)                }
                .padding(.top, 60)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
