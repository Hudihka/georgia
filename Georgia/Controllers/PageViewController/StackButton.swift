//
//  StackButton.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

final class StackButton: UIView {
    var qwestion: Qwestion? {
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
    
    init(qwestion: Qwestion) {
        self.qwestion = qwestion
        
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
        let count = (qwestion?.answer.qwestions.count ?? 1) - 1
        for ind in 0...count {
            let viw = generateViewButton(index: ind)
            verticalStackView.addArrangedSubview(viw)
        }
        
        let button = generateViewButtonWeb()
        verticalStackView.addArrangedSubview(button)
        button.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    private func generateViewButton(index: Int) -> UIView {
        let view = UIView()
        view.backgroundColor = EnumColors.white
        view.addRadius(number: 8)
        
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
        labelQwestion.text = qwestion?.answer.qwestions[index]
        
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
        
        view.addBorder(number: 3, color: EnumColors.black)
        
        if let answerTest = qwestion?.answerTest {
            if answerTest.indexTrue == index + 1 {
                view.backgroundColor = EnumColors.green
            } else if answerTest.indexWrong == index + 1 {
                view.backgroundColor = EnumColors.red
            }
        } else {
            
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
    
    private func generateViewButtonWeb() -> UIView {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonActionWeb), for: .touchUpInside)
        button.setTitle(nil, for: .normal)
        button.addRadius(number: 8)
        button.backgroundColor = .black
        button.setTitleColor(EnumColors.white, for: .normal)
        button.setTitle("На сайт (#\(qwestion?.idQwestion ?? 0))", for: .normal)
        button.titleLabel?.font = EnumFont.semibold(18).font
        
        return button
    }
    
    @objc
    private func buttonAction(sender: UIButton!) {
        guard let qwestion = qwestion else {
            return
        }
        
        let trueAnswer = sender.tag == qwestion.answer.rightOpinion
        if !trueAnswer {
            Vibro.weak()
        }
        
        let newQwestion = Qwestion(
            number: qwestion.idQwestion,
            title: qwestion.title,
            linkImage: qwestion.linkImage,
            answer: qwestion.answer,
            option: trueAnswer ? .trueOption : .falseOption,
            answerTest: Qwestion.AnswerTest(
                indexTrue: qwestion.answer.rightOpinion,
                indexWrong: trueAnswer ? nil : sender.tag
            )
        )
        
        DataManager.shared.addAnswerFor(qwestion: newQwestion)
    }
    
    @objc
    private func buttonActionWeb(sender: UIButton!) {
        guard
            let id = qwestion?.idQwestion,
            let url = URL(string: "http://teoria.on.ge/tickets?ticket=\(id)")
        else {
            return
        }
        UIApplication.shared.open(url)
    }
}
