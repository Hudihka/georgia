//
//  TestEpicViewModel.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

final class TestEpicViewModel: TestEpicViewModelProtocolOut, TestEpicDataStoreProtocol, TestEpicViewModelProtocolIn {
    private let selectedEpic: EpicWithQwestion
    private let manager = DataManager.shared
    
    var content: (EpicWithQwestion) -> Void = { _ in }
    var tapedAnswer: ([Qwestion]) -> Void = { _ in }
    
    init(epic: EpicWithQwestion) {
        self.selectedEpic = epic
    }
    
    func fetchData() {
        content(selectedEpic)
        
        manager.updateQwestionList = { [weak self] qwestions in
            self?.tapedAnswer(qwestions)
        }
        
    }
}
