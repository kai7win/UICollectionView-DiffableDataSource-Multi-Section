//
//  ProductCell.swift
//  CollectionView diffable multi section
//
//  Created by Kai Chi Tsao on 2024/5/2.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    static let identifier = "ProductCell"
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        contentView.addSubview(label)
        label.center(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
