//
//  StartView.swift
//  ios-workout-manager Watch App
//
//  Created by Pedro Veloso on 01/11/24.
//

import SwiftUI

struct StartView: View {

    @State private var heartScale = 1.0
    @State private var showRestTimerView = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("00:44")
                .font(.title)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
                .foregroundStyle(.yellow)

            Text(
                Measurement(
                    value: 0,
                    unit: UnitEnergy.kilocalories
                )
                .formatted(
                    .measurement(
                        width: .abbreviated,
                        usage: .workout,
                        numberFormatStyle: .number.precision(.fractionLength(0))
                    )
                )
            )
            .font(.title2)
            .fontWeight(.medium)
            .fontDesign(.rounded)

            HStack(spacing: 6) {
                Text("0")
                    .font(.title2)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)

                Image(systemName: "suit.heart.fill")
                    .foregroundStyle(.red)
                    .symbolEffect(.bounce, options: .repeat(.periodic))
            }

            Button {
                showRestTimerView = true
            } label: {
                HStack(spacing: 8) {
                    Text("Descansar")
                    Image(systemName: "bolt.heart.fill")
                }
            }
        }
        .sheet(isPresented: $showRestTimerView) {
            RestTimerView()
        }
    }
}

#Preview {
    StartView()
}
