//
//  MyCollectionView.swift
//  CollectionView diffable multi section
//
//  Created by Kai Chi Tsao on 2024/5/2.
//

import UIKit

class MyCollectionView: UICollectionView {
    
    let kScreenWidth = UIScreen.main.bounds.width
    private var products: [Row] = []
    private var payments: [Row] = []
    private var gifts: [Row] = []
    
    enum Section: String, CaseIterable {
        case product
        case payment
        case gift
    }
    
    private lazy var diffableDataSource =  MyCollectionDataSource(collectionView: self)
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        configureLayout()
        applySnapshot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func applySnapshot() {
        self.products = ProductModel.all.map { .product($0) }
        self.payments = PaymentModel.all.map { .payment($0) }
        self.gifts = GiftModel.all.map { .gift($0) }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Row>()
        snapshot.appendSections([.product, .payment, .gift])
        snapshot.appendItems(products, toSection: .product)
        snapshot.appendItems(payments, toSection: .payment)
        snapshot.appendItems(gifts, toSection: .gift)
        diffableDataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func configureLayout() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            switch Section.allCases[sectionIndex] {
            case .product:
                return self.createProductSection()
            case .payment:
                return self.createPaymentSection()
            case .gift:
                return self.createGiftSection()
            }
        }
        collectionViewLayout = layout
    }
    
    func createProductSection() -> NSCollectionLayoutSection {
        // Define the size of each item
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
        
        // Define the size of the group
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(200), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Create a section with the group
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func createPaymentSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    func createGiftSection() -> NSCollectionLayoutSection {
        // Define the size of each item
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(kScreenWidth), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
        
        // Define the size of the group
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(200), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Create a section with the group
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
}








