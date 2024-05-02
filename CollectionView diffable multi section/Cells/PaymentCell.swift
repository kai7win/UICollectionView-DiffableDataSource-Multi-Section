//
//  PaymentCell.swift
//  CollectionView diffable multi section
//
//  Created by Kai Chi Tsao on 2024/5/2.
//

import UIKit

class PaymentCell: UICollectionViewCell {
    
    static let identifier = "PaymentCell"
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
        contentView.addSubview(label)
        label.center(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
