//
//  TestEpicBuilder.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import Foundation
import UIKit

protocol TestEpicCallBack: AnyObject {
    
}

final class TestEpicBuilder {
    static func build(epicTest: TestStruct) -> BaseNavigationController {
        let VM = TestEpicViewModel(epic: epicTest)
        let router = TestEpicRouter(dataStore: VM)
        let VC = TestEpicViewController(
            VM: VM,
            router: router
        )
        router.VC = VC
        let NVC = BaseNavigationController(rootViewController: VC)
        NVC.modalPresentationStyle = .fullScreen

        return NVC
    }
}
