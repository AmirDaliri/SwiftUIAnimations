# SwiftUI Animation Collection - AnimationPagingView


<div align="center">
    <img src="https://github.com/AmirDaliri/SwiftUIAnimations/blob/main/ScreenRecording.gif" alt="Animation Demo">
</div>

🎨 **SwiftUI Animation Collection** - A fun project to explore and showcase various SwiftUI animations in a paginated view. From pulsating fractals and interactive particle waves to 3D rotating spheres, each animation demonstrates the creative power of SwiftUI's animation capabilities. Perfect for iOS developers looking for inspiration or anyone interested in creative coding with SwiftUI!

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Animations Included](#animations-included)
- [How It Works](#how-it-works)
- [Demo](#demo)
- [Video Demo](#video-demo)
- [License](#license)

## Features

- A **paging view** to swipe through each animation.
- Multiple unique animations created entirely in SwiftUI.
- Creative use of SwiftUI's animation capabilities to push visual and interactive boundaries.
- Clean, reusable components for each animation.
- Great for learning, inspiration, or just some fun experimentation with SwiftUI!

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/AmirDaliri/SwiftUIAnimations.git
   ```

2. Open the Xcode project:
   ```bash
   cd SwiftUIAnimations
   open SwiftUIAnimations.xcodeproj
   ```

3. Build and run the project on a simulator or device running iOS 14.0 or later.

## Animations Included

1. **Swirling Galaxy** 🌌 - A galaxy-like particle animation with swirling motion and dynamic colors.
2. **Hypnotic Spiral** 🖀 - A hypnotic, rotating spiral with vibrant color transitions.
3. **Morphing Flower** 🌸 - A dynamic, morphing flower pattern that scales and rotates.
4. **Morphing Geometric Shape** 🔶 - A geometric shape that morphs and scales based on touch interactions.
5. **Pulsating Fractal** 🌐 - A fractal pattern that continuously pulses and rotates.
6. **Interactive Particle Wave** 🌊 - A particle wave that responds to user touch, creating an immersive effect.

## How It Works

Each animation is built as an individual SwiftUI view, utilizing SwiftUI's declarative approach to create complex animations with minimal code. The animations are displayed in a `TabView` with `.page` style to create a paginated interface, allowing users to swipe between animations.

### Key SwiftUI Features Used
- **Animations**: `Animation.easeInOut`, `.repeatForever`, `.linear`
- **Gesture Handling**: `DragGesture` for interactive animations
- **State Management**: `@State` for managing animation states
- **Geometry and Transformations**: `scaleEffect`, `rotationEffect`, and `offset`

## Demo

Swipe through each animation in the app to see the effects in action! Here’s a preview of the animations included:

| Animation | Preview |
|-----------|---------|
| Swirling Galaxy | 🌌 |
| Hypnotic Spiral | 🖀 |
| Morphing Flower | 🌸 |
| Morphing Shape | 🔶 |
| Pulsating Fractal | 🌐 |
| Interactive Particle Wave | 🌊 |
---

Happy coding! Enjoy experimenting with SwiftUI animations! 🎉
