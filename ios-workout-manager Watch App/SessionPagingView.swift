//
//  SessionPagingView.swift
//  ios-workout-manager
//
//  Created by Pedro Veloso on 16/08/25.
//

import SwiftUI
import WatchKit

struct SessionPagingView: View {
    
    enum TabItem {
        case controls, metrics, nowPlaying
    }
    
    @State private var selection: TabItem = .metrics
    
    var body: some View {
        TabView(selection: $selection) {
            Tab(value: TabItem.controls) {
                ControlsView()
            }
            
            Tab(value: TabItem.metrics) {
                MetricsView()
            }
            
            Tab(value: .nowPlaying) {
                NowPlayingView()
            }
        }
    }
}

#Preview {
    SessionPagingView()
}
