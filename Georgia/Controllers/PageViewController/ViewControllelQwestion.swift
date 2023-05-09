//
//  ViewControllelQwestion.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

final class ViewControllerQwestion: UIViewController {
    private let qwestion: Qwestion
    private var answer: AnswerTest? {
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
    
    init(qwestion: Qwestion, answer: AnswerTest?) {
        self.qwestion = qwestion
        self.answer = answer
        
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
        
        var uiimageView: UIImageView? = nil
        if let link = qwestion.linkImage {
            uiimageView = UIImageView()
            viewContent.addSubview(uiimageView!)
            uiimageView?.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(wDdevice)
            }
        }
        
        viewContent.addSubview(labelTitle)
        labelTitle.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Offsets.constant16)
            make.height.greaterThanOrEqualTo(40)
            
            if let viewImage = uiimageView {
                make.top.equalTo(viewImage.snp.bottom).offset(Offsets.constant16)
            } else {
                make.top.equalToSuperview()
            }
        }
    }
}
