//
//  PageViewController.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

final class PageViewController: UIPageViewController {
    private var qwestions: [Qwestion] = []
    
    init(qwestions: [Qwestion]) {
        self.qwestions = qwestions
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = EnumColors.white
        
        let VC = generateNextVC(index: 0)
        self.setViewControllers([VC], direction: .forward, animated: true, completion: nil)
        
        self.didMove(toParent: self)
    }
    
    func scrollTo(qwestionId: Int) {
        guard
            let index = qwestions.firstIndex(where: { $0.idQwestion == qwestionId })
        else {
            return
        }
        
        let VC = generateNextVC(index: index)
        
        setViewControllers([VC], direction: .forward, animated: false, completion: nil)
    }
    
    func update(qwestions: [Qwestion]) {
        self.qwestions = qwestions
        viewControllers?
            .compactMap({ $0 as? ViewControllerQwestion })
            .forEach({ vc in
                if let qwest = qwestions.first(where: { $0.idQwestion == vc.idQwestion }) {
                    vc.updateQwestion(qwestion: qwest)
                }
            })
    }
}


extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        
        guard
            let currentVC = viewController as? ViewControllerQwestion,
            var index = qwestions.firstIndex(where: { $0.idQwestion == currentVC.idQwestion })
        else {
            return nil
        }
        
        if index == 0 {
            return nil
        }
        
        index -= 1
        
        return generateNextVC(index: index)
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        
        guard
            let currentVC = viewController as? ViewControllerQwestion,
            var index = qwestions.firstIndex(where: { $0.idQwestion == currentVC.idQwestion })
        else {
            return nil
        }
        
        if index >= self.qwestions.count - 1 {
            return nil
        }
        
        index += 1
        
        return generateNextVC(index: index)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.qwestions.count
    }
    
    private func generateNextVC(index: Int) -> ViewControllerQwestion {
        let qwestion = qwestions[index]
        
        return ViewControllerQwestion(qwestion: qwestion)
    }
}

