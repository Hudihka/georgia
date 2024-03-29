//
//  TestEpicViewController.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit
import Foundation


final class TestEpicViewController: BaseViewController {
    private enum Constant {
        static let heightCollection: CGFloat = 46
    }
    
    private let router: TestEpicRouterProtocol
    private var VM: (TestEpicViewModelProtocolIn & TestEpicViewModelProtocolOut)
    
    private let collectionQwestions = CollectionQwestions()
    private var pageVC: PageViewController?
    
    // MARK: - Initialization
    
    required init(
        VM: TestEpicViewModelProtocolIn & TestEpicViewModelProtocolOut,
        router: TestEpicRouterProtocol
    ) {
        self.VM = VM
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        VM.fetchData()
    }
    
    override func desingUI() {
        let closeBB = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .plain,
            target: self,
            action: #selector(close)
        )

        navigationItem.leftBarButtonItem = closeBB
    }
    
    override func layoutUI() {
        
        view.addSubview(collectionQwestions)
        collectionQwestions.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(Constant.heightCollection)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
    }
    
    override func lissenVM() {
        VM.content = { [weak self] content in
            guard let self = self else {
                return
            }
            
            self.collectionQwestions.content = content.qwestions
            self.pageVC = PageViewController(qwestions: content.qwestions)
            self.laoutPageVC()
            
            if let index = content.activeindex {
                self.collectionQwestions.selectedIndex = index
                self.pageVC?.scrollTo(qwestionIndex: index)
            }
        }
        
        VM.tapedAnswer = { [weak self] qwestions in
            guard let self = self else {
                return
            }
            
            self.collectionQwestions.content = qwestions
            self.pageVC?.update(qwestions: qwestions)
        }
        
        VM.selectedCwestionIndex = { [weak self] ind in
            guard let self = self else {
                return
            }
            
            self.collectionQwestions.selectedIndex = ind
            
        }
        
        collectionQwestions.tapedQwestion = { [weak self] qwestionId in
            self?.pageVC?.scrollTo(qwestionId: qwestionId)
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func close() {
        router.close()
    }
}

private extension TestEpicViewController {
    func laoutPageVC() {
        guard let pageVC = pageVC else {
            return
        }
        
        addChild(pageVC)
        let y = indentNavigationBarHeight + Constant.heightCollection + 16
        let hView = hDdevice - y
        pageVC.view.frame = CGRect(x: 0, y: y, width: wDdevice, height: hView)
        view.addSubview(pageVC.view)
        pageVC.didMove(toParent: self)
    }
}
