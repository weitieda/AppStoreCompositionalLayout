//
//  TodayButtonCell.swift
//  AppStoreCompositionalLayout
//
//  Created by Tieda Wei on 2020-01-07.
//  Copyright © 2020 Tieda Wei. All rights reserved.
//

import UIKit

class TodayButtonCell: UICollectionViewCell {
    
    static let id = "todayButtonCell"
    
    let button = UIButton(title: "Redeem", titleColor: .label, font: .boldSystemFont(ofSize: 17), backgroundColor: .tertiarySystemFill)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(button)
        button.fillSuperview()
        
        button.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
