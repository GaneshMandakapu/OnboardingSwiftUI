# SwiftUI Onboarding Flow

A smooth, customizable onboarding flow built with SwiftUI, designed to be adaptive, animated, and user-friendly.

## Features

- **Adaptive Layout:** Uses `GeometryReader` to prevent text clipping and ensure proper display on all device sizes.
- **Animated Transitions:** Smooth step transitions with fade and slide animations.
- **Customizable Steps:** Easily add or modify onboarding steps with images, icons, text, and gradient backgrounds.
- **Compact Navigation:** Includes a small circular “Back to Start” button for quick navigation without clutter.

## How It Works

- The onboarding flow tracks the current step using `@State`.
- Each step is represented by an `OnboardingStep` struct containing all content and styling info.
- Background gradients and images update dynamically based on the step.
- Text and icons animate smoothly between steps.
- Layout adapts using `GeometryReader` to prevent layout issues and text cut-offs.

## Usage

1. Add your onboarding step data in the `steps` array.
2. Customize colors using standard system colors like `.orange`, `.red`, `.gray` for good contrast.
3. Use the provided UI components for a polished onboarding experience.
4. Run and enjoy seamless onboarding in your SwiftUI app!

## Example Step Definition

```swift
OnboardingStep(
    imageName: "1",
    iconName: "pencil.and.outline",
    welcomeText: "Discover Your Notes",
    mainTitle: "Get Organized",
    description: "Take notes anytime and capture your ideas on the go",
    buttonText: "Continue",
    gradientColors: [Color.orange, Color.red]
)
