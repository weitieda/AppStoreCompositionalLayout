//
//  ViewController.swift
//  AppStoreCompositionalLayout
//
//  Created by Tieda Wei on 2020-01-04.
//  Copyright © 2020 Tieda Wei. All rights reserved.
//

import UIKit
import TDTools

class TodayCell: UICollectionViewCell {
    
    static let id = "todaycell"
    
    let imageView = UIImageView(backgroundColor: #colorLiteral(red: 0.3513580561, green: 0.7838454247, blue: 0.9800000787, alpha: 1))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.fillSuperview()
        
        imageView.layer.cornerRadius = 10
        imageView.layer.shadowColor = UIColor.lightGray.cgColor
        imageView.layer.shadowRadius = 8
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shouldRasterize = true
        imageView.layer.shadowOffset = CGSize(width: 0, height: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

class TodayController: UIViewController, UICollectionViewDataSource {
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
//        collectionView.backgroundColor = .blue
        collectionView.fillSuperview()
        
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayCell.id)
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCell.id, for: indexPath) as! TodayCell
        return cell
    }
    
    fileprivate func createLayout() -> UICollectionViewLayout {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), subitems: [item])
        
        group.interItemSpacing = .fixed(20)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
//        config.interSectionSpacing = 20
        
        let layout = UICollectionViewCompositionalLayout(section: section, configuration: config)
        return layout
    }


}

