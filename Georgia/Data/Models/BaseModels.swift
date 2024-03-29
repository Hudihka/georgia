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

extension EpicWithQwestion {
    var mistakes: Int {
        qwestions.filter({ $0.answerTest?.isWrong ?? false }).count
    }
    
    var inProgress: Bool {
        qwestions.compactMap({ $0.answerTest }).count != 0
    }
    
    var procent: Int {
        let count = qwestions.compactMap({ $0.answerTest }).count
        
        return count * 100 / qwestions.count
    }
    
    var activeindex: Int? {
        qwestions.compactMap({ $0.answerTest }).isEmpty ? nil : qwestions.firstIndex(where: { $0.answerTest == nil })
    }
}

struct Qwestion: Codable {
    let idQwestion: Int
    let title: String
    let answer: Answer
    let option: Option
    let answerTest: AnswerTest?
    
    init(
        number: Int,
        title: String,
        answer: Answer,
        option: Option = .clearOption,
        answerTest: AnswerTest? = nil
    ) {
        self.idQwestion = number
        
        self.title = title
        self.answer = answer
        self.option = option
        self.answerTest = answerTest
    }
    
    enum Option: Codable {
        case trueOption
        case falseOption
        case clearOption
    }
    
    struct AnswerTest: Codable {
        let indexTrue: Int
        let indexWrong: Int?
        
        var isWrong: Bool {
            indexWrong != nil
        }
    }
    
}

struct Answer: Codable {
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
