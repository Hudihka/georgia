//
//  BaseModels.swift
//  Georgia
//
//  Created by Худышка К on 08.05.2023.
//

import Foundation

struct EpicWithQwestion {
    
    let name: String
    let qwestions: [Qwestion]
    
}

struct Qwestion {
    let number: Int
    let title: String
    let linkImage: String?
    let answer: Answer
    
    init(number: Int, title: String, linkImage: String? = nil, answer: Answer) {
        self.number = number
        
        self.title = title
        self.linkImage = linkImage
        self.answer = answer
    }
}

struct Answer {
    let rightOpinion: Int
    
    let fist: String
    let second: String
    let three: String?
    let four: String?
    
    init(rightOpinion: Int, fist: String, second: String, three: String?, four: String? = nil) {
        self.rightOpinion = rightOpinion
        
        self.fist = fist
        self.second = second
        self.three = three
        self.four = four
    }
    
    var qwestions: [String] {
        [fist, second, three, four].compactMap({ $0 })
    }
}
