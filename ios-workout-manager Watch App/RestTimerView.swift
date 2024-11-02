//
//  RestTimerView.swift
//  ios-workout-manager Watch App
//
//  Created by Pedro Veloso on 02/11/24.
//

import SwiftUI

struct RestTimerView: View {

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "bolt.heart.fill")
                .font(.title2)
                .foregroundStyle(.red)
                .symbolEffect(.bounce, options: .repeat(.periodic))

            ProgressView(value: 0.3, total: 1)
                .tint(.green)

            Text("00:30")
                .font(.title2)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
                .foregroundStyle(.green)
        }
    }
}

#Preview {
    RestTimerView()
}
