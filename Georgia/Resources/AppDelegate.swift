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
        
        firstLoadImages()
        
        window = UIWindow(frame: CGRect(origin: CGPoint.zero, size: UIScreen.main.bounds.size))
        window?.rootViewController = EpicsViewControllerBuilder.build()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func firstLoadImages() {
//        guard UserDefManager.isLoadedAllImages == false else {
//            return
//        }
        
        let content = Content.epicQwestions.flatMap({ $0.qwestions }).filter({ $0.linkImage != nil })
        var counter = 0
        
        var arrayImg = [String]()
        
        let imageView = UIImageView()
        content.forEach { qwestion in
            SaveImg.shared.updateUI(
                imageURL: qwestion.linkImage,
                idQwestion: qwestion.idQwestion,
                imageView: imageView
            ) { _ in
                counter += 1
                arrayImg.append("georgia_image_for_tiket_\(qwestion.idQwestion).jpg")
                
                if counter == content.count {
                    UserDefManager.imLoadedAllImages()
                    
                    print(arrayImg.sorted(by: { $0 < $1 }))
                }
            }
        }
    }
}

