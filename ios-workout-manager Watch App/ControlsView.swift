//
//  ControlsView.swift
//  ios-workout-manager
//
//  Created by Pedro Veloso on 16/08/25.
//

import SwiftUI

struct ControlsView: View {
    var body: some View {
        HStack {
            ControlButton(type: .end) {
                // TODO: End session
            }
            
            ControlButton(type: .pause) {
                // TODO: Pause / Resume session
            }
        }
    }
}

private struct ControlButton: View {
    enum `Type`: String {
        case end, pause, resume
        
        var iconSystemName: String {
            switch self {
            case .end: "xmark"
            case .pause: "pause"
            case .resume: "play"
            }
        }

        var tint: Color {
            switch self {
            case .end: .red
            case .pause: .yellow
            case .resume: .green
            }
        }
    }
    
    let type: Type
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Image(systemName: type.iconSystemName)
            }
            .tint(type.tint)
            .font(.title2)
            
            Text(type.rawValue.capitalized)
                .font(.headline)
                .foregroundStyle(type.tint)
        }
    }
}

#Preview {
    ControlsView()
}
