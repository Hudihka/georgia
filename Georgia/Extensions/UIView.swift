//
//  UIView.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

extension UIView {
    func addRadius(number: CGFloat) {
        self.layer.cornerRadius = number
        self.layer.masksToBounds = true
    }

    func addBorder(number: CGFloat, color: UIColor) {
        layer.borderWidth = number
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
    }
}
