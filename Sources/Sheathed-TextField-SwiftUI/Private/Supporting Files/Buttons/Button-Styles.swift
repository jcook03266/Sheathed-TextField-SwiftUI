//
//  Button-Styles.swift
//
//  Created by Justin Cook on 12/3/22.
//

import SwiftUI

/// Shrinks the button by the specified amount
struct GenericSpringyShrink: ButtonStyle {
    var springResponse: CGFloat = 1.2
    var scaleAmount: CGFloat = 0.8
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.75 : 1)
            .scaleEffect(configuration.isPressed ? scaleAmount : 1)
            .animation(.spring(response: 1.2), value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == GenericSpringyShrink {
    static var genericSpringyShrink: Self {
        return .init()
    }
}
