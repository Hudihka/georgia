//
//  CollectionAnswer.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import UIKit

final class CollectionQwestions: UICollectionView {
    
    var content: [CollectionQwesrions] = [] {
        didSet {
            reloadData()
        }
    }
    
    var tapedQwestion: (Int) -> Void = { _ in }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        super.init(frame: .zero, collectionViewLayout: layout)

        self.backgroundColor = .clear

        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.register(
            QwestionCollectionCell.self,
            forCellWithReuseIdentifier: QwestionCollectionCell.className
        )

        self.contentInset = UIEdgeInsets(
            top: Offsets.constant8,
            left: Offsets.constant8,
            bottom: Offsets.constant8,
            right: Offsets.constant8
        )

        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionQwestions: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: QwestionCollectionCell.className,
                for: indexPath
            ) as? QwestionCollectionCell
        else {
            fatalError()
        }
        
        cell.qwestion = content[indexPath.row]
        return cell
    }
}

extension CollectionQwestions: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(
            width: 40,
            height: 30
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        Offsets.constant8
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        Offsets.constant8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tapedQwestion(content[indexPath.row].idQwestion)
    }
}
