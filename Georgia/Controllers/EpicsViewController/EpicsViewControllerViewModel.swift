//
//  EpicsViewControllerViewModel.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

final class EpicsViewControllerViewModel: EpicsViewControllerViewModelProtocolOut, EpicsViewControllerDataStoreProtocol {
    let dataManager = DataManager.shared
    var selectedEpic: EpicWithQwestion? = nil
    
    var content: ([EpicWithQwestion]) -> Void = { _ in }
    
    
}

extension EpicsViewControllerViewModel: EpicsViewControllerViewModelProtocolIn {
    func fetchContent() {
        let returnContent = DataManager.shared.generateStartContent()
        content(returnContent)
        
        dataManager.updateEpicList = { [weak self] epics in
            self?.content(epics)
        }
    }
    
    func clearAndOpenEpic(epic: EpicWithQwestion) {
        self.selectedEpic = epic
        // чистим user def от этой темы
        
        fetchContent()
    }
    
    func beginEpic(epic: EpicWithQwestion) {
        self.selectedEpic = epic
    }
    
    func tapedAnswer() {
        
    }
}
