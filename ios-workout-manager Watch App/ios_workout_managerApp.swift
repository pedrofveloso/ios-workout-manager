//
//  ios_workout_managerApp.swift
//  ios-workout-manager Watch App
//
//  Created by Pedro Veloso on 01/11/24.
//

import SwiftUI

@main
struct ios_workout_manager_Watch_AppApp: App {
    @StateObject private var workoutManager = WorkoutManager()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                SessionPagingScreen()
            }
            .environmentObject(workoutManager)
        }
        
//        WKNotificationScene(controller: NotificationController.self, category: "ios_workout_managerApp")
    }
}
