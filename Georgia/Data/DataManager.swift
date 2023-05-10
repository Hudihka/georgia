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
    var updateEpicList: ([EpicWithQwestion]) -> Void = { _ in }
    var selectedQwestionId: (Int) -> Void = { _ in }
    
    func generateStartContent() -> [EpicWithQwestion] {
        content.map({
            let qwestions = $0.qwestions.compactMap({ oldQw in
                let qw = UserDefManager.getsavedQwestion(id: oldQw.idQwestion)
                return qw == nil ? oldQw : qw
            })
            
            return EpicWithQwestion(name: $0.name, qwestions: qwestions)
        })
    }
    
    func clear(epic: EpicWithQwestion) -> [EpicWithQwestion] {
        content.map({
            let qwestions = epic.name != $0.name ?
            $0.qwestions.compactMap({ oldQw in
                let qw = UserDefManager.getsavedQwestion(id: oldQw.idQwestion)
                return qw == nil ? oldQw : qw
            }) :
            $0.qwestions.compactMap({ oldQw in
                UserDefManager.removeQwestion(id: oldQw.idQwestion)
                return oldQw
            })
            
            return EpicWithQwestion(name: $0.name, qwestions: qwestions)
        })
    }
    
    func addAnswerFor(qwestion: Qwestion) {
        UserDefManager.saveQwestion(qwestion: qwestion)
        let newQwestions = generateTestModel(epicName: epicWorking)
        
        updateQwestionList(newQwestions.qwestions)
        updateEpicList(generateStartContent())
    }
    
    func setEpicWorking(name: String) {
        self.epicWorking = name
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
    
    func selectedQwestion(id: Int?) {
        guard let id = id else {
            return
        }
        selectedQwestionId(id)
    }
}
