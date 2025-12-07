import SwiftUI
import SwiftData

struct ClockListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Clock.order) private var clocks: [Clock]
    @State private var isShowingAddClock = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(clocks) { clock in
                    ClockRowView(clock: clock)
                }
                .onDelete(perform: deleteClocks)
                .onMove(perform: moveClocks)
            }
            .listStyle(.plain)
            .navigationTitle("World Clock")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingAddClock = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddClock) {
                AddClockView()
            }
        }
    }
    
    private func deleteClocks(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(clocks[index])
            }
        }
    }
    
    private func moveClocks(from source: IndexSet, to destination: Int) {
        // Make a mutable copy of the array to reorder
        var updatedClocks = clocks
        updatedClocks.move(fromOffsets: source, toOffset: destination)
        
        // Update the order property for each clock
        for (index, clock) in updatedClocks.enumerated() {
            clock.order = index
        }
    }
}

#Preview {
    ClockListView()
        .modelContainer(for: Clock.self, inMemory: true)
}
