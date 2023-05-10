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
    let idQwestion: Int
    let title: String
    let linkImage: String?
    let answer: Answer
    let option: Option
    let answerTest: AnswerTest?
    
    init(
        number: Int,
        title: String,
        linkImage: String? = nil,
        answer: Answer,
        option: Option = .clearOption,
        answerTest: AnswerTest? = nil
    ) {
        self.idQwestion = number
        
        self.title = title
        self.linkImage = linkImage
        self.answer = answer
        self.option = option
        self.answerTest = answerTest
    }
    
    enum Option {
        case trueOption
        case falseOption
        case clearOption
    }
    
    struct AnswerTest {
        let indexTrue: Int
        let indexWrong: Int?
        
        var isWrong: Bool {
            indexWrong != nil
        }
    }
    
}

struct Answer {
    let rightOpinion: Int
    
    let fist: String
    let second: String
    let three: String?
    let four: String?
    
    init(rightOpinion: Int, fist: String, second: String, three: String? = nil, four: String? = nil) {
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
