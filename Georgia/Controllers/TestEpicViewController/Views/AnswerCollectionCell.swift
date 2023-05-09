//
//  AnswerCollectionCell.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

final class QwestionCollectionCell: BaseCollectionCell {
    private var labelNumber: UILabel = {
        let label = UILabel()
        label.textColor = EnumColors.black
        label.font = EnumFont.regular(16).font
        label.textAlignment = .center
        
        return label
    }()
    
    var qwestion: CollectionQwesrions? {
        didSet {
            updateContent()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func desingUI() {
        contentView.addRadius(number: 6)

        contentView.addSubview(labelNumber)
        labelNumber.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    private func updateContent() {
        guard let qwestion = qwestion else {
            return
        }
        
        labelNumber.text = "\(qwestion.number)"
        
        switch qwestion.option {
        case .clearOption:
            contentView.backgroundColor = EnumColors.white
            contentView.addBorder(number: 3, color: EnumColors.black)
        case .falseOption:
            contentView.backgroundColor = EnumColors.red
            contentView.addBorder(number: 3, color: EnumColors.clear)
        case .trueOption:
            contentView.backgroundColor = EnumColors.green
            contentView.addBorder(number: 3, color: EnumColors.clear)
        }
    }
}
