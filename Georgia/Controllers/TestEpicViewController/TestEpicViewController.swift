//
//  TestEpicViewController.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit


final class TestEpicViewController: BaseViewController {
    private enum Constant {
    }
    
    private let router: TestEpicRouterProtocol
    private var VM: (TestEpicViewModelProtocolIn & TestEpicViewModelProtocolOut)
    
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
        
    }
    
    override func layoutUI() {
    }
    
    override func lissenVM() {
        VM.content = { [weak self] content in
            guard let self = self else {
                return
            }
            
            self.title = content.title
        }
    }
}
