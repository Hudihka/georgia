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
        
        
        let epicTest = DataManager.shared.generateTestModel(epic: epic)
        let testVC = TestEpicBuilder.build(epicTest: epicTest)
        VC.present(testVC, animated: true)
    }
}
