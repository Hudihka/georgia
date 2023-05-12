//
//  ContentForTrawel.swift
//  Georgia
//
//  Created by Худышка К on 12.05.2023.
//

// методы для переноса контента в другое приложение

import Foundation

typealias JSON = [String: Any]

final class ContentForTrawel {
    
    static let shared = ContentForTrawel()
    
    func customKeyFromUrl(id: Int) -> String {
        "georgia_image_for_tiket_\(id).jpg"
    }
    
    
//    CAB452E7-D029-427A-AE53-46760BD16E40
}
