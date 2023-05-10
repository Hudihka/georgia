//
//  EpicCell.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import Foundation
import UIKit

final class EpicCell: BaseCell {
    
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = EnumColors.black
        label.font = EnumFont.bold(22).font
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private let labelSubtitle: UILabel = {
        let label = UILabel()
        label.textColor = EnumColors.black
        label.font = EnumFont.regular(16).font
        label.textAlignment = .left
        
        return label
    }()
    
    private let labelMisstake: UILabel = {
        let label = UILabel()
        label.textColor = EnumColors.red
        label.font = EnumFont.regular(16).font
        label.textAlignment = .right
        
        return label
    }()
    
    var epic: EpicWithQwestion? {
        didSet {
            updateCell()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func desingUI() {

        contentView.addSubview(labelTitle)
        labelTitle.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Offsets.constant16)
            make.top.equalToSuperview().inset(Offsets.constant8)
            make.height.greaterThanOrEqualTo(20)
        }
        
        contentView.addSubview(labelSubtitle)
        labelSubtitle.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Offsets.constant16)
            make.bottom.equalToSuperview().inset(Offsets.constant8)
            make.top.equalTo(labelTitle.snp.bottom).offset(Offsets.constant8)
            make.width.equalTo(150)
        }
        
        contentView.addSubview(labelMisstake)
        labelMisstake.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Offsets.constant16)
            make.top.equalTo(labelSubtitle.snp.top)
            make.bottom.equalTo(labelSubtitle.snp.bottom)
            make.width.equalTo(50)
        }
        
    }
    
    private func updateCell() {
        guard let epic = epic else {
            return
        }
        
        labelTitle.text = epic.name
        labelSubtitle.text = "Вопросов: \(epic.qwestions.count)"
        labelMisstake.text = epic.mistakes == 0 ? "" : "\(epic.mistakes)/\(epic.qwestions.count)"
        contentView.backgroundColor = epic.inProgress ? EnumColors.gray : EnumColors.white
    }
}
