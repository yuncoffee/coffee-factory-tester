//
//  GrayScale.swift
//  coffee-factory-tester
//
//  Created by Yun Dongbeom on 2023/09/02.
//

import Foundation
import SwiftUI

extension Color {
    static var primaryLightness = Color.primary100
    static var primaryLight = Color.primary300
    static var primaryColor = Color.primary500
    static var primaryDark = Color.primary700
    static var primaryDarkness = Color.primary900
}

// MARK: - GrayScale
extension Color {
    static var systemWhite = Color("gray0_white")
    static var systemGray100 = Color("gray100")
    static var systemGray200 = Color("gray200")
    static var systemGray300 = Color("gray300")
    static var systemGray400 = Color("gray400")
    static var systemGray500 = Color("gray500")
    static var systemGray600 = Color("gray600")
    static var systemGray700 = Color("gray700")
    static var systemGray800 = Color("gray800")
    static var systemGray900 = Color("gray900")
    static var systemBlack = Color("gray1000_black")
}

// MARK: - PrimaryColorScale
extension Color {
    private static var primary100 = Color("primary100")
    private static var primary300 = Color("primary300")
    private static var primary500 = Color("primary500")
    private static var primary700 = Color("primary700")
    private static var primary900 = Color("primary900")
}


