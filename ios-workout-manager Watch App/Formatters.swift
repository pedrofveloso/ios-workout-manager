//
//  Formatters.swift
//  ios-workout-manager
//
//  Created by Pedro Veloso on 16/08/25.
//

import Foundation

extension DateComponentsFormatter {
    static let hourMinuteSecondFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
}
