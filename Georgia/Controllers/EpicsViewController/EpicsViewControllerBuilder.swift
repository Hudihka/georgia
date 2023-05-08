//
//  EpicsViewControllerBuilder.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import Foundation
import UIKit

protocol EpicsViewControllerCallBack: AnyObject {
    func updateContent()
}

final class EpicsViewControllerBuilder {
    static func build() -> BaseNavigationController {
        let VM = EpicsViewControllerViewModel()
        let router = EpicsViewControllerRouter(dataStore: VM)
        let VC = EpicsViewController(
            VM: VM,
            router: router
        )
        router.VC = VC
        
        let NVC = BaseNavigationController(rootViewController: VC)
        
        return NVC
    }
}
