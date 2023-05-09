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
        
        let content = Content.epicQwestions.flatMap({ $0.qwestions }).compactMap({ $0.linkImage })
        print(content.count)
        var counter = 0
        
        let imageView = UIImageView()
        content.forEach { string in
            SaveImg.shared.updateUI(imageURL: string, imageView: imageView) { _ in
                counter += 1
                print("\(counter)/\(content.count)")
            }
        }
        
        window = UIWindow(frame: CGRect(origin: CGPoint.zero, size: UIScreen.main.bounds.size))
        window?.rootViewController = EpicsViewControllerBuilder.build()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func firstLoadImages() {
        guard UserDefManager.isLoadedAllImages == false else {
            return
        }
        
        let content = Content.epicQwestions.flatMap({ $0.qwestions }).compactMap({ $0.linkImage })
        var counter = 0
        
        let imageView = UIImageView()
        content.forEach { string in
            SaveImg.shared.updateUI(imageURL: string, imageView: imageView) { _ in
                counter += 1
                if counter == content.count {
                    UserDefManager.imLoadedAllImages()
                }
            }
        }
    }
}

