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
    
    func generateTestModel(epic: ListModel) -> TestStruct {
        generateTestModel(epicName: epic.title)
    }
    
    func generateTestModel(epicName: String) -> TestStruct {
        let qwestions = content.first(where: { $0.name == epicName })?.qwestions ?? []
        let listAnswers = [AnswerTest]()
        let collectionQwesrions: [CollectionQwesrions] = qwestions
            .enumerated()
            .map({ CollectionQwesrions(number: $0.offset + 1, idQwestion: $0.element.number, option: .clearOption )})
        
        return TestStruct(
            name: epicName,
            qwestions: qwestions,
            listAnswers: listAnswers,
            collectionQwesrions: collectionQwesrions
        )
    }
}
