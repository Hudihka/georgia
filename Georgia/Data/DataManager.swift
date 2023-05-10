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
    
    var updateQwestionList: ([Qwestion]) -> Void = { _ in }
    
    func generateStartContent() -> [EpicWithQwestion] {
        []
//        content.map({ ListModel(title: $0.name, countQwestion: $0.qwestions.count, mistakes: 0, inProgress: false) })
    }
    
    func generateTestModel(epic: EpicWithQwestion) -> EpicWithQwestion {
        generateTestModel(epicName: epic.name)
    }
    
    func generateTestModel(epicTitle: String) -> EpicWithQwestion {
        generateTestModel(epicName: epicTitle)
    }
    
    func addAnswerFor(qwestion: Qwestion) {
        UserDefManager.saveQwestion(qwestion: qwestion)
        let newQwestions = generateTestModel(epicName: epicWorking)
        
        updateQwestionList(newQwestions.qwestions)
    }
    
    private func generateTestModel(
        epicName: String
    ) -> EpicWithQwestion {
        epicWorking = epicName
        
        let qwestions = content.first(where: { $0.name == epicName })?.qwestions.compactMap({
            let qw = UserDefManager.getsavedQwestion(id: $0.idQwestion)
            return qw == nil ? $0 : qw
        })
        
        return EpicWithQwestion(
            name: epicName,
            qwestions: qwestions ?? []
        )
    }
}
