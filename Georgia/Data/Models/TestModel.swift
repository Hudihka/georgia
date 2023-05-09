//
//  TestModel.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import Foundation

struct TestStruct {
    let name: String
    let qwestions: [Qwestion]
    let listAnswers: [AnswerTest]
    let collectionQwesrions: [CollectionQwesrions]
}

struct CollectionQwesrions {
    let number: Int
    let idQwestion: Int
    let option: Option
    
    enum Option {
        case trueOption
        case falseOption
        case clearOption
    }
}

struct AnswerTest {
    let idQwestion: Int
    let indexTrue: Int
    let indexWrong: Int?
    
    var isWrong: Bool {
        indexWrong != nil
    }
}
