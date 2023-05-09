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
        
        let label = UILabel()
        view.addSubview(label)
        label.numberOfLines = 0
        label.text = qwestion.title
        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.height.greaterThanOrEqualTo(100)
            make.centerY.equalTo(view.snp.centerY)
        }
    }
}
