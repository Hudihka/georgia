//
//  TestEpicProtocols.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

protocol TestEpicViewModelProtocolIn {
    init(epic: TestStruct)
    
    func fetchData() 
}

protocol TestEpicViewModelProtocolOut {
    var content: (TestStruct) -> Void { get set }
}

protocol TestEpicDataStoreProtocol {
}

protocol TestEpicRouterProtocol {
	init(dataStore: TestEpicDataStoreProtocol)
    
    func close()
}
