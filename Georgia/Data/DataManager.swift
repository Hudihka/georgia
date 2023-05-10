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
    private var epicWorking = ""
    
    func generateStartContent() -> [ListModel] {
        content.map({ ListModel(title: $0.name, countQwestion: $0.qwestions.count, mistakes: 0, inProgress: false) })
    }
    
    func generateTestModel(epic: ListModel) -> TestStruct {
        generateTestModel(epicName: epic.title)
    }
    
    func generateTestModel(epicTitle: String) -> TestStruct {
        generateTestModel(epicName: epicTitle)
    }
    
    func addAnswerFor(Qwestion: Qwestion) {

        // сохраняем структуру


    }
    
    private func generateTestModel(
        epicName: String
    ) -> TestStruct {
        epicWorking = epicName
        
//        let qwestions = content.first(where: { $0.name == epicName })?.qwestions.map({
            // узнаем есть ли в юд такая структура
//            let qw = UserDefManager.
//            return qw == nil ? $0 : qw
//        })
        
        let qwestions = content.first(where: { $0.name == epicName })?.qwestions ?? []
        
        return TestStruct(
            name: epicName,
            qwestions: qwestions
        )
    }
}
