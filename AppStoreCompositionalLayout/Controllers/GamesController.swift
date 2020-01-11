//
//  GamesController.swift
//  AppStoreCompositionalLayout
//
//  Created by Tieda Wei on 2020-01-08.
//  Copyright © 2020 Tieda Wei. All rights reserved.
//

import UIKit

class GamesController: UIViewController, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCell.id, for: indexPath) as! TodayCell
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayButtonCell.id, for: indexPath) as! TodayButtonCell
            return cell
        }
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
    
    
    
}
