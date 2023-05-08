//
//  TestEpicViewModel.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

final class TestEpicViewModel: TestEpicViewModelProtocolOut, TestEpicDataStoreProtocol, TestEpicViewModelProtocolIn {
    
    private var selectedEpic: ListModel {
        didSet {
            content(selectedEpic)
        }
    }
    
    var content: (ListModel) -> Void = { _ in }
    
    init(epic: ListModel) {
        self.selectedEpic = epic
    }
    
    func fetchData() {
        content(selectedEpic)
    }
}
