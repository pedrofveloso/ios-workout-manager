//
//  SummaryView.swift
//  ios-workout-manager
//
//  Created by Pedro Veloso on 16/08/25.
//

import HealthKit
import SwiftUI

struct SummaryView: View {
    @State private var durationFormatter = DateComponentsFormatter.hourMinuteSecondFormatter
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                SummaryMetricView(
                    title: "Tempo Total",
                    value: durationFormatter.string(from: 30 * 60 + 15) ?? ""
                ).accentColor(.yellow)
                
                SummaryMetricView(
                    title: "Calorias Gastas",
                    value: Measurement(value: 459, unit: UnitEnergy.kilocalories)
                        .formatted(
                            .measurement(
                                width: .abbreviated,
                                usage: .workout,
                                numberFormatStyle: .number.precision(
                                    .fractionLength(
                                        0
                                    )
                                )
                            )
                        )
                ).accentColor(.pink)
                
                SummaryMetricView(
                    title: "Média de BPM",
                    value: 150
                        .formatted(.number.precision(.fractionLength(0))) + " bpm"
                ).accentColor(.yellow)
                
                Text("Círculos")
                ActivityRingsView(heathStore: HKHealthStore())
                    .frame(width: 50, height: 50)
                
                Button("Feito") {
                    // TODO: Action
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
            }
//            .scenePadding()
        }
        .navigationTitle("Resumo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct SummaryMetricView: View {
    private let title: String
    private let value: String
    private let isDividerVisible: Bool
    
    init(title: String, value: String, isDividerVisible: Bool = true) {
        self.title = title
        self.value = value
        self.isDividerVisible = isDividerVisible
    }
    
    var body: some View {
        Text(title)
        
        Text(value)
            .font(.system(.title2, design: .rounded).lowercaseSmallCaps())
            .foregroundStyle(.tint)
       
        if isDividerVisible {
            Divider()
        }
    }
}

#Preview {
    SummaryView()
}
