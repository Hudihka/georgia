//
//  PageViewController.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

final class PageViewController: UIPageViewController {
    
    private let qwestions: [Qwestion]
    private var answers: [AnswerTest] = [] {
        didSet {
            
        }
    }
    
    private var currentIndex: Int = 0
    
    init(qwestions: [Qwestion], answers: [AnswerTest]?) {
        self.qwestions = qwestions
        self.answers = answers ?? []
        
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
    
    
    
}


extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        
        guard
            let currentVC = viewController as? ViewControllerQwestion,
            var index = qwestions.firstIndex(where: { $0.number == currentVC.idQwestion })
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
            var index = qwestions.firstIndex(where: { $0.number == currentVC.idQwestion })
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
        let answerTest = answers.first(where: { $0.idQwestion == qwestion.number })
        
        return ViewControllerQwestion(qwestion: qwestion, answerTest: answerTest)
    }
}

