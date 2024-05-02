//
//  ViewController.swift
//  CollectionView diffable multi section
//
//  Created by Kai Chi Tsao on 2024/5/2.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionView = MyCollectionView()
        view.addSubview(collectionView)
        collectionView.addConstraintsToFillView(view)
    }
}

