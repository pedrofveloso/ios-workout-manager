//
//  ElapsedTimeView.swift
//  ios-workout-manager
//
//  Created by Pedro Veloso on 16/08/25.
//

import SwiftUI

struct ElapsedTimeView: View {
    var elapsedTime: TimeInterval
    
    @State private var timeFormatter = ElapsedTimeFormatter()
    
    var body: some View {
        Text(NSNumber(value: elapsedTime), formatter: timeFormatter)
            .fontWeight(.semibold)
    }
}

class ElapsedTimeFormatter: Formatter {
    let componentsFormatter = DateComponentsFormatter.hourMinuteSecondFormatter
    
    override func string(for value: Any?) -> String? {
        guard let time = value as? TimeInterval else { return nil }
        
        return componentsFormatter.string(from: time)
    }
}

#Preview {
    ElapsedTimeView(elapsedTime: 12345)
}
