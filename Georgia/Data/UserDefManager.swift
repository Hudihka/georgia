//
//  UserDefManager.swift
//  Georgia
//
//  Created by Худышка К on 10.05.2023.
//

import Foundation

final class UserDefManager {
    private static let ud = UserDefaults.standard
    
    private enum EnumKeys: String {
        case loadAllImages
    }
    
    static func imLoadedAllImages() {
        ud.set(true, forKey: EnumKeys.loadAllImages.rawValue)
    }
    
    static var isLoadedAllImages: Bool {
        ud.bool(forKey: EnumKeys.loadAllImages.rawValue)
    }
}
