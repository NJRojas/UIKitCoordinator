# UIKit Coordinator

Sample app demonstrating how to apply MVVM-C in SwiftUI without using NavigationStack.

- This approach creates a Coordinator that owns a UINavigationController to manage navigation, following the classic MVVM-C pattern from UIKit.
- Each SwiftUI screen is wrapped in a UIHostingController, enabling navigation and presentation logic to remain in the Coordinator layer while keeping ViewModels platform-agnostic and testable.
- Designed for projects targeting iOS 13–15, or for integrating SwiftUI views into legacy UIKit apps.

## Advantages

1. Clear separation of concerns

Navigation logic lives outside the views and view models.
- Views handle layout and user interaction.
- ViewModels abstract and handle state and business logic.
- Coordinators handles navigation.

2. Testability
- Since navigation and UI is decoupled, it is easier to test ViewModels

3. Reusability
- Different Coordinators can reuse the same screen for different flow navigation.

4. Centralized navigation
- all routes are keep in one placed,
- Makes easier to implement deep-links, feature flags

5. Easier dependency injection.
- Coordinatorscan construct and inject dependencies into ViewModels in one place.


### Using a Coordinator makes SwiftUI navigation deterministic, testable, and UIKit-compatible — ideal for scalable architectures and legacy integrations.

I think it's not comparable with `NavigationStack` since from iOS16 we can save all the boilerplate of creating the coordinator, the NVStack handles the navigation and pure SwiftUI is the present and the future. Still this an option for legacy UIKit code.
Coordinator
