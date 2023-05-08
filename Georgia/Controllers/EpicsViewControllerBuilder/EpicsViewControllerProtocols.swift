//
//  EpicsViewControllerProtocols.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

protocol EpicsViewControllerViewModelProtocolIn {
}

protocol EpicsViewControllerViewModelProtocolOut {
}

protocol EpicsViewControllerDataStoreProtocol {
}

protocol EpicsViewControllerRouterProtocol {
	init(dataStore: EpicsViewControllerDataStoreProtocol)
}
