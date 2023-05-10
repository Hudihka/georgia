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
    var selectedCwestionIndex: (Int) -> Void = { _ in }
    
    init(epic: EpicWithQwestion) {
        self.selectedEpic = epic
    }
    
    func fetchData() {
        content(selectedEpic)
        
        manager.updateQwestionList = { [weak self] qwestions in
            self?.tapedAnswer(qwestions)
        }
        
        manager.selectedQwestionId = { [weak self] id in
            if
                let self = self,
                let ind = self.selectedEpic.qwestions.firstIndex(where: { $0.idQwestion == id })
            {
                self.selectedCwestionIndex(ind)
            }
        }

        
    }
}
