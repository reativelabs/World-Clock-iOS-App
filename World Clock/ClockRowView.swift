import SwiftUI

struct ClockRowView: View {
    let clock: Clock
    @State private var timeString: String = ""
    @State private var timeDifferenceString: String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(timeDifferenceString)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(clock.city)
                    .font(.title)
                    .fontWeight(.regular)
            }
            
            Spacer()
            
            Text(timeString)
                .font(.system(size: 50, weight: .light))
        }
        .padding(.vertical, 8)
        .onAppear {
            updateTime()
        }
        .onReceive(timer) { _ in
            updateTime()
        }
    }
    
    private func updateTime() {
        guard let timeZone = TimeZone(identifier: clock.timeZoneIdentifier) else { return }
        let now = Date()
        
        // Time String
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.timeZone = timeZone
        timeString = formatter.string(from: now)
        
        // Time Difference
        let currentSeconds = TimeZone.current.secondsFromGMT(for: now)
        let targetSeconds = timeZone.secondsFromGMT(for: now)
        let difference = targetSeconds - currentSeconds
        let hours = difference / 3600
        
        let calendar = Calendar.current
        let currentDay = calendar.component(.day, from: now)
        
        // Adjust "now" to the target timezone to check if it's a different day
        var targetCalendar = Calendar.current
        targetCalendar.timeZone = timeZone
        let targetDay = targetCalendar.component(.day, from: now)
        
        var dayString = "Today"
        if targetDay > currentDay {
            dayString = "Tomorrow"
        } else if targetDay < currentDay {
            dayString = "Yesterday"
        }
        // Handle month/year wrap around simply by checking day difference if needed, 
        // but for simple world clock "Yesterday/Today/Tomorrow" is usually sufficient logic 
        // based on day component difference assuming not more than 24h diff usually.
        // A more robust way:
        let dayDiff = targetDay - currentDay
        if dayDiff == 1 || dayDiff < -20 { // wrap around month
             dayString = "Tomorrow"
        } else if dayDiff == -1 || dayDiff > 20 {
             dayString = "Yesterday"
        } else if dayDiff == 0 {
            dayString = "Today"
        }
        
        let sign = hours >= 0 ? "+" : ""
        timeDifferenceString = "\(dayString), \(sign)\(hours)HRS"
    }
}

#Preview {
    ClockRowView(clock: Clock(city: "New York", timeZoneIdentifier: "America/New_York"))
}
