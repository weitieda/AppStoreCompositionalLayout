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
    
    let buttonTitles = ["Redeem", "Sent Gift", "Add Funds to Apple ID"]
    
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
        collectionView.register(TodayButtonCell.self, forCellWithReuseIdentifier: TodayButtonCell.id)
        
        collectionView.dataSource = self
    }
    
    fileprivate func addTopNotchBlurView() {
        let blurEffect = UIBlurEffect(style: .systemMaterial)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        view.addSubview(blurEffectView)
        blurEffectView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.topAnchor, trailing: view.trailingAnchor)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonTitles.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCell.id, for: indexPath) as! TodayCell
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayButtonCell.id, for: indexPath) as! TodayButtonCell
            cell.button.setTitle(buttonTitles[indexPath.item], for: .normal)
            return cell
        }
    }
    
    fileprivate func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, env) -> NSCollectionLayoutSection? in
            
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            
            let group: NSCollectionLayoutGroup
            if sectionIndex == 0 {
                group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)), subitems: [item])
            } else {
                group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44)), subitems: [item])
            }
            
            let todayHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: TodayHeader.kind, alignment: .top)
            let todayFooter = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44)), elementKind: TodayFooter.kind, alignment: .bottom)
            
            let section = NSCollectionLayoutSection(group: group)
            if sectionIndex == 0 {
                section.contentInsets = .init(top: 8, leading: 20, bottom: 0, trailing: 20)
                section.interGroupSpacing = 20
                section.boundarySupplementaryItems = [todayHeader]
            } else if sectionIndex == 1 {
                section.contentInsets = .init(top: 30, leading: 20, bottom: 20, trailing: 20)
                section.interGroupSpacing = 8
                section.boundarySupplementaryItems = [todayFooter]
            }
            return section
        }
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

