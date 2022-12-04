//
//  CommonMath.swift
//  
//  Created by Justin Cook on 12/3/22.
//

import Foundation

extension CGSize {
    // MARK: - Dynamic
    func scaleBy(_ factor: CGFloat) -> CGSize {
        return CGSize(width: self.width * factor, height: self.height * factor)
    }
}
