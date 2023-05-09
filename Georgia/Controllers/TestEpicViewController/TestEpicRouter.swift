//
//  TestEpicRouter.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

final class TestEpicRouter: TestEpicRouterProtocol {
    
	private let dataStore: TestEpicDataStoreProtocol
	weak var VC: UIViewController?

	init(dataStore: TestEpicDataStoreProtocol) {
		self.dataStore = dataStore
	}
    
    func close() {
        VC?.navigationController?.dismiss(animated: true)
    }
}
