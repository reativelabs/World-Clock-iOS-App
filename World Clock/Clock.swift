import Foundation
import SwiftData

@Model
final class Clock {
    var id: UUID
    var city: String
    var timeZoneIdentifier: String
    var order: Int
    
    init(city: String, timeZoneIdentifier: String, order: Int = 0) {
        self.id = UUID()
        self.city = city
        self.timeZoneIdentifier = timeZoneIdentifier
        self.order = order
    }
}
