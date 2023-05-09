//
//  BaseCollectionCell.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import Foundation
import UIKit

class BaseCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = EnumColors.white

        desingUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func desingUI(){}

}
