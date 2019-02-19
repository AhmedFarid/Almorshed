//
//  CollectionView.swift
//  Jak
//
//  Created by farido on 1/9/19.
//  Copyright © 2019 E-Bakers. All rights reserved.
//

import UIKit


class CollectionView: UICollectionView {
    
    private let numberOfCellsPerRow = 3
    private let spacing: CGFloat = 10
    
    private var flowLayout: UICollectionViewFlowLayout? {
        return collectionViewLayout as? UICollectionViewFlowLayout
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        sharedInit()
        updateItemSize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
        updateItemSize()
    }
    
    private func sharedInit() {
        flowLayout?.minimumInteritemSpacing = spacing
        flowLayout?.minimumLineSpacing = spacing
    }
    
    
    private func updateItemSize() {
        let cellWidth = floor((bounds.width - (CGFloat(numberOfCellsPerRow) - 1) * spacing) / CGFloat(numberOfCellsPerRow))
        flowLayout?.itemSize = CGSize(width: cellWidth, height: cellWidth)
        flowLayout?.invalidateLayout()
    }
    
    override var bounds: CGRect {
        didSet {
            if bounds != oldValue {
                updateItemSize()
            }
        }
    }
}
