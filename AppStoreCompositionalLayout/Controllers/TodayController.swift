//
//  ViewController.swift
//  AppStoreCompositionalLayout
//
//  Created by Tieda Wei on 2020-01-04.
//  Copyright © 2020 Tieda Wei. All rights reserved.
//

import UIKit
import TDTools

class TodayController: UIViewController, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .systemBackground
        
        setupCollectionView()
        addTopNotchBlurView()
    }
    
    fileprivate func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.fillSuperview()
        
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayCell.id)
        collectionView.register(TodayHeader.self, forSupplementaryViewOfKind: TodayHeader.kind, withReuseIdentifier: TodayHeader.id)
        collectionView.register(TodayFooter.self, forSupplementaryViewOfKind: TodayFooter.kind, withReuseIdentifier: TodayFooter.id)
        
        collectionView.dataSource = self
    }
    
    fileprivate func addTopNotchBlurView() {
        let blurEffect = UIBlurEffect(style: .systemMaterial)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        view.addSubview(blurEffectView)
        blurEffectView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.topAnchor, trailing: view.trailingAnchor)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCell.id, for: indexPath) as! TodayCell
        return cell
    }
    
    fileprivate func createLayout() -> UICollectionViewLayout {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)), subitems: [item])
        group.interItemSpacing = .fixed(20)
        
        let todayHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: TodayHeader.kind, alignment: .top)
        let todayFooter = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44)), elementKind: TodayFooter.kind, alignment: .bottom)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        section.boundarySupplementaryItems = [todayHeader, todayFooter]
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
//        config.interSectionSpacing = 20
        
        let layout = UICollectionViewCompositionalLayout(section: section, configuration: config)
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == TodayHeader.kind {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: TodayHeader.kind, withReuseIdentifier: TodayHeader.id, for: indexPath) as! TodayHeader
            return header
        } else if kind == TodayFooter.kind {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: TodayFooter.kind, withReuseIdentifier: TodayFooter.id, for: indexPath) as! TodayFooter
            return footer
        } else {
            return UICollectionReusableView()
        }
    }


}

