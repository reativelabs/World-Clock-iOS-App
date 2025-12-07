import SwiftUI
import SwiftData

struct AddClockView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var searchText = ""
    
    var timeZones: [String] {
        TimeZone.knownTimeZoneIdentifiers.filter {
            searchText.isEmpty || $0.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            List(timeZones, id: \.self) { identifier in
                Button(action: {
                    addClock(identifier: identifier)
                }) {
                    Text(identifier.replacingOccurrences(of: "_", with: " "))
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Choose a City")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func addClock(identifier: String) {
        // Extract city name from identifier (e.g., "America/New_York" -> "New York")
        let components = identifier.split(separator: "/")
        let city = components.last?.replacingOccurrences(of: "_", with: " ") ?? identifier
        
        let newClock = Clock(city: city, timeZoneIdentifier: identifier)
        modelContext.insert(newClock)
        dismiss()
    }
}

#Preview {
    AddClockView()
}
