//
//  MetricsView.swift
//  ios-workout-manager Watch App
//
//  Created by Pedro Veloso on 01/11/24.
//

import SwiftUI

struct MetricsView: View {

    @State private var heartScale = 1.0
    @State private var showRestTimerView = false
    
    @State private var current: Int = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            HStack(spacing: 8) {
                Text("Stiff pés próximos com barra livre")
                    .font(.footnote)
                    .lineLimit(2)
                
                Spacer(minLength: 4)

                CircularProgressView(current: current, total: 3)
                    .frame(height: 38)
                    .onTapGesture {
                        current += 1
                        print(current)
                    }
            }
            
            VStack(alignment: .leading) {
                ElapsedTimeView(elapsedTime: 44)
                    .font(.title3)

                HStack(spacing: 6) {
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
                    
                    Text("/")
                    
                    Text("0")

                    Image(systemName: "suit.heart.fill")
                        .foregroundStyle(.red)
                        .symbolEffect(.bounce, options: .repeat(.periodic))
                }
            }
            
            Spacer()
        }
        .safeAreaInset(edge: .bottom) {
            Button {
                showRestTimerView = true
            } label: {
                Text("Descansar")
                Image(systemName: "bolt.heart.fill")
            }
            .tint(.green.opacity(0.5))
            .frame(maxWidth: .infinity)
        }
        .sheet(isPresented: $showRestTimerView) {
            RestTimerView()
        }
    }
}

#Preview {
    MetricsView()
}

struct CircularProgressView: View {
    let current: Int
    let total: Int
    
    var progress: Double {
        Double(current) / Double(total)
    }
    
    var color: Color {
        if progress < 0.4 {
            .red
        } else if progress < 1 {
            .yellow
        } else {
            .green
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.5),
                    lineWidth: 4
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: 4,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.bouncy, value: progress)
            
            Text("\(current)/\(total)")
                .font(.headline)
                .foregroundStyle(color)
        }
        .contentShape(Circle())
    }
}
