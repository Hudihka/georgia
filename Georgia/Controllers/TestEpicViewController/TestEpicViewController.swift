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
    }
    
    private let router: TestEpicRouterProtocol
    private var VM: (TestEpicViewModelProtocolIn & TestEpicViewModelProtocolOut)
    
    private let collectionQwestions = CollectionQwestions()
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
            make.height.equalTo(46)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    override func lissenVM() {
        VM.content = { [weak self] content in
            guard let self = self else {
                return
            }
            
            self.collectionQwestions.content = content.collectionQwesrions
//            self.title = content.title
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func close() {
        router.close()
    }
}
