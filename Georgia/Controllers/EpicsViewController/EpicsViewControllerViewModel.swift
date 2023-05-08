//
//  EpicsViewControllerViewModel.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

final class EpicsViewControllerViewModel: EpicsViewControllerViewModelProtocolOut, EpicsViewControllerDataStoreProtocol {
    var selectedEpic: ListModel? = nil
    
    var content: ([ListModel]) -> Void = { _ in }
    
    
}

extension EpicsViewControllerViewModel: EpicsViewControllerViewModelProtocolIn {
    func fetchContent() {
        let returnContent = DataManager.shared.generateStartContent()
        content(returnContent)
    }
    
    func clearAndOpenEpic(epic: ListModel) {
        self.selectedEpic = epic
        // чистим user def от этой темы
        
        fetchContent()
    }
    
    func beginEpic(epic: ListModel) {
        self.selectedEpic = epic
    }
    
    func tapedAnswer() {
        
    }
}
