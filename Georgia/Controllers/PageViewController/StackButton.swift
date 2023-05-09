//
//  StackButton.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

final class StackButton: UIView {
    private let answer: Answer
    var answerTest: AnswerTest? {
        didSet {
            verticalStackView.safelyRemoveArrangedSubviews()
            reloadStack()
        }
    }
    
    private var verticalStackView: UIStackView = {
        let item = UIStackView()
        item.axis = .vertical
        item.alignment = .leading
        item.backgroundColor = .clear
        item.spacing = Offsets.constant8

        return item
    }()
    
    init(answer: Answer, answerTest: AnswerTest?) {
        self.answer = answer
        self.answerTest = answerTest
        
        super.init(frame: .zero)
        
        desingUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func desingUI() {
        
        addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview().inset(Offsets.constant16)
        }
        
        reloadStack()
    }
    
    func reloadStack() {
        for ind in 0...answer.qwestions.count - 1 {
            let viw = generateViewButton(index: ind)
            verticalStackView.addArrangedSubview(viw)
        }
    }
    
    private func generateViewButton(index: Int) -> UIView {
        let view = UIView()
        view.backgroundColor = EnumColors.white
        view.addRadius(number: 6)
        
        let labelNumber = UILabel()
        labelNumber.textColor = EnumColors.black
        labelNumber.font = EnumFont.bold(18).font
        labelNumber.text = "\(index + 1)"
        labelNumber.textAlignment = .center
        
        let labelQwestion = UILabel()
        labelQwestion.textColor = EnumColors.black
        labelQwestion.font = EnumFont.semibold(18).font
        labelQwestion.textAlignment = .left
        labelQwestion.numberOfLines = 0
        labelQwestion.text = answer.qwestions[index]
        
        view.addSubview(labelNumber)
        labelNumber.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.left.equalToSuperview().inset(Offsets.constant8)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        let widthLabel = wDdevice - 20 - 2 * Offsets.constant8 - 2 * Offsets.constant16
        view.addSubview(labelQwestion)
        labelQwestion.snp.makeConstraints { make in
            make.right.top.bottom.equalToSuperview().inset(Offsets.constant8)
            make.left.equalTo(labelNumber.snp.right).offset(Offsets.constant8)
            make.height.greaterThanOrEqualTo(20)
            make.width.equalTo(widthLabel)
        }
        
        if let answerTest = answerTest {
            if answerTest.indexTrue == index + 1 {
                view.backgroundColor = EnumColors.green
            } else if answerTest.indexWrong == index + 1 {
                view.backgroundColor = EnumColors.red
            }
        } else {
            view.addBorder(number: 3, color: EnumColors.black)
            
            let button = UIButton()
            button.tag = index + 1
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.setTitle(nil, for: .normal)
            view.addSubview(button)
            button.snp.makeConstraints { make in
                make.top.bottom.left.right.equalToSuperview()
            }
        }
        
        
        
        return view
    }
    
    @objc
    private func buttonAction(sender: UIButton!) {
      print("Button tapped")
    }
}
