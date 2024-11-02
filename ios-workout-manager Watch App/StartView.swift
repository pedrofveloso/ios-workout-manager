//
//  StartView.swift
//  ios-workout-manager Watch App
//
//  Created by Pedro Veloso on 01/11/24.
//

import SwiftUI

struct StartView: View {

    @State private var heartScale = 1.0

    private var animation: Animation {
        .easeInOut(duration: 0.4)
        .repeatForever()
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("00:44")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .foregroundStyle(.yellow)

                HStack {
                    Text("0")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .fontDesign(.rounded)

                    VStack(alignment: .leading, spacing: -4) {
                        Text("CAL")
                        Text("ATIVAS")
                    }
                    .font(.caption2)
                    .fontWeight(.semibold)

                }

                HStack(spacing: 6) {
                    Text("0")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .fontDesign(.rounded)

                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                        .scaleEffect(heartScale)
                        .animation(.bouncy.repeatForever(), value: true)
                        .onAppear() {
                            withAnimation(animation) {
                                heartScale = 1.2
                            }
                        }
                }

                NavigationLink {
                    Text("Tela de descanso")
                } label: {
                    HStack(spacing: 8) {
                        Text("Descansar")
                        Image(systemName: "bolt.heart.fill")
                    }
                }

            }
        }
    }
}

#Preview {
    StartView()
}
