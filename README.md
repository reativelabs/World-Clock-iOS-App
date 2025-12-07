# World Clock

A comprehensive World Clock application built with SwiftUI and SwiftData. This app allows users to track time across multiple time zones effortlessly.

## Screenshots

![World Clock Screenshot 1](image%201.png)
![World Clock Screenshot 2](image%202.png)

## Features

- **Multi-Clock Support**: Add and manage clocks for various cities and time zones.
- **Real-Time Updates**: Accurate time display for all added locations.
- **Data Persistence**: Uses SwiftData to save your clock configuration between launches.
- **Modern UI**: Clean and responsive interface built with SwiftUI.

## Requirements

- **Xcode**: Version 15.0 or later.
- **iOS**: iOS 17.0 or later (required for SwiftData).
- **macOS**: Sonoma 14.0 or later (recommended for development).

## Installation

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd "World Clock"
   ```

2. **Open the project**:
   Double-click on `World Clock.xcodeproj` to open it in Xcode.

## How to Run

1. **Select the Scheme**:
   Ensure "World Clock" is selected in the active scheme dropdown (next to the play button in the top-left corner of Xcode).

2. **Select Destination**:
   Choose a Simulator (e.g., iPhone 15 Pro) or a connected physical device from the destination list.

3. **Build and Run**:
   - Press `Cmd + R` on your keyboard.
   - Or click the **Play** button (▶️) in the Xcode toolbar.

4. **Troubleshooting**:
   - If you encounter build errors, ensure you are using the correct version of Xcode and that the iOS Deployment Target is set to 17.0 or higher.
   - Use `Cmd + Shift + K` to clean the build folder if behavior is unexpected.

## Project Structure

- **World_ClockApp.swift**: The entry point of the application, setting up the SwiftData `ModelContainer`.
- **ContentView.swift**: The main view hosting the application's UI.
- **Clock.swift**: The data model defining the properties of a clock.
- **ClockListView.swift**: Displays the list of user-added clocks.
- **AddClockView.swift**: The interface for adding new clocks.

## specific Commands

- **Run Unit Tests**: `Cmd + U`
- **Clean Build Folder**: `Cmd + Shift + K`

Created by [Reative](https://reative.org).
