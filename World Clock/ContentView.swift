import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        ClockListView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Clock.self, inMemory: true)
}
