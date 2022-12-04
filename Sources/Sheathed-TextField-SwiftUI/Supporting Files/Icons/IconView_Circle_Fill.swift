//
//  IconView_Circle_Fill.swift
//
//  Created by Justin Cook on 11/23/22.
//

import SwiftUI

struct IconView_Circle_Fill: View {
    var iconImage: Image?,
        iconColor: Color,
        backgroundColor: Color,
        iconSize: CGSize,
        backgroundSize: CGSize,
        gradient: LinearGradient? = nil,
        enableShadow: Bool = true,
        shadowColor: Color = .gray.opacity(0.45),
        shadowRadius: CGFloat = 0,
        shadowOffset: CGSize = CGSize(width: 0,
                                      height: 4)
    
    var body: some View {
        iconImage?
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .frame(width: iconSize.width,
                   height: iconSize.height)
            .background(
                Circle()
                    .frame(width: backgroundSize.width,
                           height: backgroundSize.height)
                    .foregroundColor(backgroundColor)
                    .if(gradient != nil, transform: { view in
                        view
                            .applyGradient(gradient: gradient!)
                    })
                    .shadow(color: enableShadow ? shadowColor : .clear,
                            radius: shadowRadius,
                            x: shadowOffset.width,
                            y: shadowOffset.height)
            )
            .foregroundColor(iconColor)
    }
}

#if DEBUG
struct IconView_Circle_Fill_Previews: PreviewProvider {
    static var previews: some View {
        IconView_Circle_Fill(iconImage: Image(systemName: "aqi.medium"),
                             iconColor: .white,
                             backgroundColor: .black,
                             iconSize: CGSize(width: 40,
                                              height: 40),
                             backgroundSize: CGSize(width: 60,
                                                    height: 60))
    }
}
#endif
