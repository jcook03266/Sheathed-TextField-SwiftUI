//
//  GradientModifiers.swift
//  Inspec
//
//  Created by Justin Cook on 11/18/22.
//

import SwiftUI

extension View {
    func applyGradient(gradient: LinearGradient) -> some View {
        self
            .overlay(gradient)
            .mask(
                self
            )
    }
}
