//
//  UserDefManager.swift
//  Georgia
//
//  Created by Худышка К on 10.05.2023.
//

import Foundation

final class UserDefManager {
    private static let ud = UserDefaults.standard
    
    private enum EnumKeys {
        case loadAllImages
        case qwestion(value: Int)
        
        var key: String {
            switch self {
            case .loadAllImages:
                return "loadAllImages"
            case .qwestion(let value):
                return "qwestion_\(value)"
            }
        }
    }
    
    static func imLoadedAllImages() {
        ud.set(true, forKey: EnumKeys.loadAllImages.key)
    }
    
    static var isLoadedAllImages: Bool {
        ud.bool(forKey: EnumKeys.loadAllImages.key)
    }
    
    static func saveQwestion(qwestion: Qwestion) {
        let key = EnumKeys.qwestion(value: qwestion.idQwestion).key
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(qwestion) {
            ud.set(encoded, forKey: key)
        }
    }
    
    static func removeQwestion(id: Int) {
        let key = EnumKeys.qwestion(value: id).key
        
        ud.removeObject(forKey: key)
    }
    
    static func getsavedQwestion(id: Int) -> Qwestion? {
        let key = EnumKeys.qwestion(value: id).key
        
        if let savedPerson = ud.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(Qwestion.self, from: savedPerson) {
                return loadedPerson
            }
        }
        
        return nil
    }
}
