//
//  EpicsViewControllerProtocols.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

protocol EpicsViewControllerViewModelProtocolIn {
    func fetchContent()
    
    func clearAndOpenEpic(epic: ListModel)
    func beginEpic(epic: ListModel)
    
    func tapedAnswer()
}

protocol EpicsViewControllerViewModelProtocolOut {
    var content: ([ListModel]) -> Void { get set }
}

protocol EpicsViewControllerDataStoreProtocol {
    var selectedEpic: ListModel? { get set }
}

protocol EpicsViewControllerRouterProtocol {
	init(dataStore: EpicsViewControllerDataStoreProtocol)
    
    func openEpic()
}
