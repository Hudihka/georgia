//
//  AppDelegate.swift
//  Georgia
//
//  Created by Худышка К on 21.01.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        window = UIWindow(frame: CGRect(origin: CGPoint.zero, size: UIScreen.main.bounds.size))
        window?.rootViewController = EpicsViewControllerBuilder.build()
        window?.makeKeyAndVisible()
        
        return true
    }
   
}

