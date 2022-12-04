//
//  HapticFeedback.swift
//
//  Created by Justin Cook on 11/1/22.
//

import CoreHaptics
import UIKit

/// Dispatcher that dispatches specific preconfigured bursts of haptic feedback to further enhance UX
struct HapticFeedbackDispatcher {
    static func textFieldPressed() {
        Impacts.generateImpact(with: .light, intensity: 0.35)
    }
    
    static func textFieldInFieldButtonPressed() {
        Impacts.generateImpact(with: .light, intensity: 0.3)
    }
    
    static func genericButtonPress() {
        Impacts.generateImpact(with: .light, intensity: 0.6)
    }
    
    struct Impacts{}
}

private extension HapticFeedbackDispatcher.Impacts {
    /// Impact with specific style and intensity from 0 - 1
    static func generateImpact(with style: UIImpactFeedbackGenerator.FeedbackStyle, intensity: CGFloat) {
        let generator = UIImpactFeedbackGenerator(style: style)
        
        generator.prepare()
        generator.impactOccurred(intensity: intensity)
    }
}
