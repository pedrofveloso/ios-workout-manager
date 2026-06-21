//
//  WorkoutManager.swift
//  ios-workout-manager
//
//  Created by Pedro Veloso on 17/08/25.
//

import Foundation
import HealthKit

class WorkoutManager: NSObject, ObservableObject {
    let healthStore = HKHealthStore()
    
    var session: HKWorkoutSession?
    var builder: HKLiveWorkoutBuilder?
    
    func startWorkout() {
        let configuration = HKWorkoutConfiguration()
        configuration.activityType = .traditionalStrengthTraining
        configuration.locationType = .indoor
        
        do {
            session = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
            builder = session?.associatedWorkoutBuilder()
        } catch {
            // TODO: Handle error
            return
        }
        
        guard let builder else {
            // TODO: Handle nil builder
            return
        }
        
        builder.dataSource = HKLiveWorkoutDataSource(
            healthStore: healthStore,
            workoutConfiguration: configuration
        )
        
        let startData = Date()
        session?.startActivity(with: startData)
        builder.beginCollection(withStart: startData) { success, error in
            // The workout has started
        }
    }
}

// MARK: - Request Authorization to HealthKit

extension WorkoutManager {
    func requestAuthorization() async throws {
        let typesToShare: Set = [HKQuantityType.workoutType()]
        
        let typesToRead: Set = [
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            .quantityType(forIdentifier: .activeEnergyBurned)!,
            HKObjectType.activitySummaryType()
        ]
        
        try await healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead)
    }
}
