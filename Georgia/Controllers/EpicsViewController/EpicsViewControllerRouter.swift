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
    
    func openEpic() {
        guard let epic = dataStore.selectedEpic, let VC = VC else {
            return
        }
        
        DataManager.shared.setEpicWorking(name: epic.name)
        let testVC = TestEpicBuilder.build(epicTest: epic)
        VC.present(testVC, animated: true)
    }
}
