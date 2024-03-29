//
//  ViewControllelQwestion.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit
import DTPhotoViewerController

final class ViewControllerQwestion: UIViewController {
    private var qwestion: Qwestion? {
        didSet {
            stackButton?.qwestion = qwestion
        }
    }
    
    var idQwestion: Int {
        qwestion?.idQwestion ?? 0
    }
    
    private let viewContent = UIView()
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = EnumColors.black
        label.font = EnumFont.semibold(22).font
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    private var stackButton: StackButton?
    private var uiimageView: UIImageView? = nil
    
    init(qwestion: Qwestion) {
        self.qwestion = qwestion
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = EnumColors.white
        
        desingUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataManager.shared.selectedQwestion(id: qwestion?.idQwestion)
    }
    
    private func desingUI() {
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(viewContent)
        viewContent.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
            make.width.equalTo(wDdevice)
            make.height.greaterThanOrEqualTo(scrollView.snp.height)
        }
        
        if
            let id = qwestion?.idQwestion,
            let image = UIImage(named: "georgia_image_for_tiket_\(id)")
        {
            uiimageView = UIImageView()
            guard let uiimageView = uiimageView else {
                return
            }
            
            uiimageView.image = image
            
            viewContent.addSubview(uiimageView)
            uiimageView.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(wDdevice)
            }
            
            let button = UIButton()
            button.isEnabled = true
            button.addTarget(self, action: #selector(buttonImageAction), for: .touchUpInside)
            button.setTitle(nil, for: .normal)
            
            viewContent.addSubview(button)
            button.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(wDdevice)
            }
        }
        
        viewContent.addSubview(labelTitle)
        labelTitle.text = qwestion?.title
        labelTitle.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Offsets.constant16)
            make.height.greaterThanOrEqualTo(40)
            
            if let viewImage = uiimageView {
                make.top.equalTo(viewImage.snp.bottom).offset(Offsets.constant16)
            } else {
                make.top.equalToSuperview()
            }
        }
        
        guard let qwestion = qwestion else { return }
        
        stackButton = StackButton(qwestion: qwestion)
        
        guard let stackButton = stackButton else { return }
        
        viewContent.addSubview(stackButton)
        stackButton.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.height.greaterThanOrEqualTo(20)
            make.top.equalTo(labelTitle.snp.bottom)
        }
        
        let falseDownView = UIView()
        viewContent.addSubview(falseDownView)
        falseDownView.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(0)
            make.left.right.equalToSuperview()
            make.top.equalTo(stackButton.snp.bottom)
            make.bottom.equalTo(viewContent.snp.bottom)
        }
    }
    
    @objc
    private func buttonImageAction() {
        guard let imgView = uiimageView else {
            return
        }
        
        let viewController = DTPhotoViewerController(referencedView: imgView, image: imgView.image)
        self.present(viewController, animated: true, completion: nil)
    }
    
    func updateQwestion(qwestion: Qwestion) {
        self.qwestion = qwestion
    }
}
