//
//  UIStackView.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

extension UIStackView {
    /// Безопасно удаляет arrangedSubviews деактивируя их NSLayoutConstraint
    @objc func safelyRemoveArrangedSubviews() {
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }

    func addSubviewInStack(_ view: UIView) {
        addArrangedSubview(view)
    }
}
