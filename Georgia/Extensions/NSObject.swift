//
//  NSObject.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import Foundation

extension NSObject {
    static var className: String {
        String(describing: self)
    }
}
