//
//  TestEpicViewModel.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

final class TestEpicViewModel: TestEpicViewModelProtocolOut, TestEpicDataStoreProtocol, TestEpicViewModelProtocolIn {
    private let nameEpic: String
    private var selectedEpic: TestStruct {
        didSet {
            content(selectedEpic)
        }
    }
    
    var content: (TestStruct) -> Void = { _ in }
    
    init(epic: TestStruct) {
        self.selectedEpic = epic
        self.nameEpic = epic.name
    }
    
    func fetchData() {
        content(selectedEpic)
    }
}
