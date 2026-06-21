//
//  SessionPagingScreen.swift
//  ios-workout-manager
//
//  Created by Pedro Veloso on 16/08/25.
//

import SwiftUI
import WatchKit

struct SessionPagingScreen: View {
    
    enum TabItem {
        case controls, metrics, nowPlaying
    }
    
    @State private var selection: TabItem = .metrics
    
    var body: some View {
        TabView(selection: $selection) {
            Tab(value: TabItem.controls) {
                SessionControlsScreen()
            }
            
            Tab(value: TabItem.metrics) {
                MetricsScreen()
            }
            
            Tab(value: .nowPlaying) {
                NowPlayingView()
            }
        }
    }
}

#Preview {
    SessionPagingScreen()
}
