//
//  EpicsViewControllerViewController.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit


final class EpicsViewController: BaseViewController {
    private enum Constant {
    }
    
    private let router: EpicsViewControllerRouterProtocol
    private var VM: (EpicsViewControllerViewModelProtocolIn & EpicsViewControllerViewModelProtocolOut)
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var content: [EpicWithQwestion] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Initialization
    
    required init(
        VM: EpicsViewControllerViewModelProtocolIn & EpicsViewControllerViewModelProtocolOut,
        router: EpicsViewControllerRouterProtocol
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
        
        VM.fetchContent()
    }
    
    override func desingUI() {
        title = "Темы"
        
        tableView.register(
            EpicCell.self,
            forCellReuseIdentifier: EpicCell.className
        )

        tableView.dataSource = self
        tableView.delegate = self

        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none

        tableView.sectionHeaderHeight = UITableView.automaticDimension
    }
    
    override func layoutUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.bottom.top.right.left.equalToSuperview()
        }
    }
    
    override func lissenVM() {
        VM.content = { [weak self] arr in
            self?.content = arr
        }
    }
}

extension EpicsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: EpicCell.className,
            for: indexPath
        ) as? EpicCell else {
            fatalError()
        }
        
        cell.epic = content[indexPath.row]
        
        return cell
    }
}

extension EpicsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let epic = content[indexPath.row]
        
        if epic.inProgress {
            showAlertFor(
                epic: epic
            ) { [weak self] _ in
                self?.openAndRemove(epic: epic)
            } nextAnswer: { [weak self] _ in
                self?.open(epic: epic)
            }
            
        } else {
            VM.beginEpic(epic: epic)
            router.openEpic()
        }
    }
    
    func open(epic: EpicWithQwestion) {
        VM.beginEpic(epic: epic)
        router.openEpic()
    }
    
    func openAndRemove(epic: EpicWithQwestion) {
        VM.clearAndOpenEpic(epic: epic)
        router.openEpic()
    }
}

extension EpicsViewController: EpicsViewControllerCallBack {
    func updateContent() {
        VM.tapedAnswer()
    }
}

extension EpicsViewController {
    func showAlertFor(
        epic: EpicWithQwestion,
        removeAnswer: @escaping (UIAlertAction) -> Void,
        nextAnswer: @escaping (UIAlertAction
    ) -> Void) {
        let alert = UIAlertController(
            title: "Хотите продолжить \(epic.name)?",
            message: nil,
            preferredStyle: UIAlertController.Style.alert
        )
        
        alert.addAction(UIAlertAction(title: "Продолжить", style: UIAlertAction.Style.default, handler: nextAnswer))
        alert.addAction(UIAlertAction(title: "Начать с начала", style: UIAlertAction.Style.destructive, handler: removeAnswer))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
