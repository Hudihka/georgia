//
//  EpicsViewControllerProtocols.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

protocol EpicsViewControllerViewModelProtocolIn {
    func fetchContent()
    
    func clearAndOpenEpic(epic: EpicWithQwestion)
    func beginEpic(epic: EpicWithQwestion)
    
    func tapedAnswer()
}

protocol EpicsViewControllerViewModelProtocolOut {
    var content: ([EpicWithQwestion]) -> Void { get set }
}

protocol EpicsViewControllerDataStoreProtocol {
    var selectedEpic: EpicWithQwestion? { get set }
}

protocol EpicsViewControllerRouterProtocol {
	init(dataStore: EpicsViewControllerDataStoreProtocol)
    
    func openEpic()
}
