//
//  UIResources.swift
//  Georgia
//
//  Created by Худышка К on 08.05.2023.
//

import Foundation
import UIKit

let hDdevice = UIScreen.main.bounds.size.height
let wDdevice = UIScreen.main.bounds.size.width

var isIPhoneWithBang: Bool {
    UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
}

let statusBarHeight: CGFloat = isIPhoneWithBang ? 44 : 20
let navigBarHeight: CGFloat = 44
let heightTabBar: CGFloat = isIPhoneWithBang ? 84 : 49

let indentNavigationBarHeight: CGFloat = statusBarHeight + navigBarHeight // 88 : 64

enum EnumColors {
    static let white = UIColor.white
    static let black = UIColor.black
    static let green = UIColor.green
    static let red   = UIColor.red
    static let clear = UIColor.clear
    static let gray  = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1)
}

enum EnumFont {
    case bold(CGFloat)
    case semibold(CGFloat)
    case regular(CGFloat)
    case medium(CGFloat)
    case light(CGFloat)

    private var wedding: UIFont.Weight {
        switch self {
        case .bold:
            return UIFont.Weight.bold

        case .semibold:
            return UIFont.Weight.semibold

        case .regular:
            return UIFont.Weight.regular

        case .medium:
            return UIFont.Weight.medium

        case .light:
            return UIFont.Weight.light
        }
    }

    var font: UIFont {
        switch self {
        case .bold(let size):
            return UIFont.systemFont(ofSize: size, weight: wedding)

        case .semibold(let size):
            return UIFont.systemFont(ofSize: size, weight: wedding)

        case .regular(let size):
            return UIFont.systemFont(ofSize: size, weight: wedding)

        case .medium(let size):
            return UIFont.systemFont(ofSize: size, weight: wedding)

        case .light(let size):
            return UIFont.systemFont(ofSize: size, weight: wedding)
        }
    }
}
