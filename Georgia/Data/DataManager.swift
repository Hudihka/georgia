//
//  DataManager.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import Foundation

final class DataManager {
    
    static let shared = DataManager()
    
    private let content = Content.epicQwestions
    
    func generateStartContent() -> [ListModel] {
        content.map({ ListModel(title: $0.name, countQwestion: $0.qwestions.count, mistakes: 0, inProgress: false) })
    }
    
    
}
