//
//  ViewControllelQwestion.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit
import DTPhotoViewerController

final class ViewControllerQwestion: UIViewController {
    private let qwestion: Qwestion
    private var answerTest: AnswerTest? {
        didSet {
            
        }
    }
    
    var idQwestion: Int {
        qwestion.number
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
    
    init(qwestion: Qwestion, answerTest: AnswerTest?) {
        self.qwestion = qwestion
        self.answerTest = answerTest
        
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
        
        if let link = qwestion.linkImage {
            uiimageView = UIImageView()
            guard let uiimageView = uiimageView else {
                return
            }
            
            viewContent.addSubview(uiimageView)
            uiimageView.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(wDdevice)
            }
            
            let button = UIButton()
            button.isEnabled = false
            button.addTarget(self, action: #selector(buttonImageAction), for: .touchUpInside)
            button.setTitle(nil, for: .normal)
            
            viewContent.addSubview(button)
            button.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(wDdevice)
            }
            
            SaveImg.shared.updateUI(
                imageURL: link,
                imageView: uiimageView
            ) { _ in
                button.isEnabled = true
            }
            
            
            
        }
        
        viewContent.addSubview(labelTitle)
        labelTitle.text = qwestion.title
        labelTitle.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Offsets.constant16)
            make.height.greaterThanOrEqualTo(40)
            
            if let viewImage = uiimageView {
                make.top.equalTo(viewImage.snp.bottom).offset(Offsets.constant16)
            } else {
                make.top.equalToSuperview()
            }
        }
        
        stackButton = StackButton(answer: qwestion.answer, answerTest: answerTest)
        guard let stackButton = stackButton else {
            return
        }
        
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
        let viewController = DTPhotoViewerController(referencedView: nil, image: uiimageView?.image)
//        viewController.automaticallyUpdateReferencedViewVisibility = false
        self.present(viewController, animated: true, completion: nil)
    }
}
