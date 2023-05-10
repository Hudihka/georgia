//
//  TestEpicProtocols.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

protocol TestEpicViewModelProtocolIn {
    init(epic: EpicWithQwestion)
    
    func fetchData() 
}

protocol TestEpicViewModelProtocolOut {
    var content: (EpicWithQwestion) -> Void { get set }
    var tapedAnswer: ([Qwestion]) -> Void { get set }
}

protocol TestEpicDataStoreProtocol {
}

protocol TestEpicRouterProtocol {
	init(dataStore: TestEpicDataStoreProtocol)
    
    func close()
}
