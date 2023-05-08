//
//  EpicsViewControllerRouter.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

final class EpicsViewControllerRouter: EpicsViewControllerRouterProtocol {
	private let dataStore: EpicsViewControllerDataStoreProtocol
	weak var VC: UIViewController?

	init(dataStore: EpicsViewControllerDataStoreProtocol) {
		self.dataStore = dataStore
	}
}
