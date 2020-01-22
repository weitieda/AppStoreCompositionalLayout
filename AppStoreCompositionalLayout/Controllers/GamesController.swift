//
//  GamesController.swift
//  AppStoreCompositionalLayout
//
//  Created by Tieda Wei on 2020-01-08.
//  Copyright © 2020 Tieda Wei. All rights reserved.
//

import UIKit

class RedCell: UICollectionViewCell {
    static let id = "insCell"
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
        layer.borderColor = UIColor.green.cgColor
        layer.borderWidth = 2
        
        contentView.addSubview(label)
        label.centerInSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AppStoreHeaderView: UICollectionReusableView {
    
    static let id = "id"
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .darkGray
        
        addSubview(label)
        label.centerInSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GamesController: UIViewController, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    let headerKind = "header"
    let sections = ["Popular Games", "Top Apple Arcade Games", "New Games We love"]
    
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: headerKind, withReuseIdentifier: AppStoreHeaderView.id, for: indexPath) as! AppStoreHeaderView
        header.label.text = sections[indexPath.section]
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RedCell.id, for: indexPath) as! RedCell
        cell.label.text = "\(indexPath.item)"
        return cell
    }
    
    fileprivate func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.fillSuperview()
        
        collectionView.register(RedCell.self, forCellWithReuseIdentifier: RedCell.id)
        collectionView.register(AppStoreHeaderView.self, forSupplementaryViewOfKind: headerKind, withReuseIdentifier: AppStoreHeaderView.id)
        
        collectionView.dataSource = self
    }
    
    
    fileprivate func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, env) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.85), heightDimension: .absolute(250)), subitems: [item])
            //        group.interItemSpacing = .fixed(20)
            
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44)), elementKind: self.headerKind, alignment: .top)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 0, leading: 12, bottom: 0, trailing: 12)
            section.interGroupSpacing = 20
            section.orthogonalScrollingBehavior = .groupPaging
            section.boundarySupplementaryItems = [header]
            
            return section
        }
    }
    
}


import SwiftUI

struct MainPreview: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        typealias UIViewControllerType = GamesController
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> GamesController {
            return GamesController()
        }
        
        func updateUIViewController(_ uiViewController: GamesController, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
            
        }
    }
}

