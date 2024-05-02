//
//  MyCollectionDataSource.swift
//  CollectionView diffable multi section
//
//  Created by Kai Chi Tsao on 2024/5/2.
//

import UIKit

class MyCollectionDataSource: UICollectionViewDiffableDataSource<MyCollectionView.Section, Row> {
    init(collectionView: UICollectionView){
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
        collectionView.register(PaymentCell.self, forCellWithReuseIdentifier: PaymentCell.identifier)
        collectionView.register(GiftCell.self, forCellWithReuseIdentifier: GiftCell.identifier)
        
        super.init(collectionView: collectionView) { collectionView, indexPath, item in
            switch item {
            case .product(let model):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
                cell.label.text = model.name
                return cell
            case .payment(let model):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaymentCell.identifier, for: indexPath) as! PaymentCell
                cell.label.text = model.name
                return cell
            case .gift(let model):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GiftCell.identifier, for: indexPath) as! GiftCell
                cell.label.text = model.name
                return cell
            }
        }
    }
}
