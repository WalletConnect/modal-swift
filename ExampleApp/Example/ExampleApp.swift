import SwiftUI

#if DEBUG
    import Atlantis
#endif

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    #if DEBUG
                        Atlantis.start()
                    #endif
                }
        }
    }
}
