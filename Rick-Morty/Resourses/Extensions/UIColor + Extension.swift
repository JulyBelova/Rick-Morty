//
//  UIColor + Extension.swift
//  Rick-Morty
//
//  Created by July Belova on 13.04.2024.
//

import UIKit

enum AppColors {
    static let accentLightBlue = UIColor().hex(0xE3F2FD)
    static let accentBlue = UIColor().hex(0x2196F3)
    
    static let accentBlueHeart = UIColor().hex(0x11B0C8)
    static let accentRedHeart = UIColor().hex(0xEE1717)
    
    static let accentWhite = UIColor().hex(0xFFFFFF)

    static let accentLightGrey = UIColor().hex(0xDADADA)
    static let accentGrey = UIColor().hex(0x8E8E93)
    static let accentDarkGrey = UIColor().hex(0x081F32)
}

extension UIColor {
    func hex(_ rgbValue: UInt64) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
