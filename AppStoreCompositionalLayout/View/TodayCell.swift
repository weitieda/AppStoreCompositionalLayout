//
//  TodayCell.swift
//  AppStoreCompositionalLayout
//
//  Created by Tieda Wei on 2020-01-06.
//  Copyright © 2020 Tieda Wei. All rights reserved.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    static let id = "todaycell"
    
    let imageView = UIImageView(backgroundColor: #colorLiteral(red: 0.3513580561, green: 0.7838454247, blue: 0.9800000787, alpha: 1))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.fillSuperview()
        
        imageView.layer.cornerRadius = 10
        imageView.layer.shadowColor = UIColor.systemGray.cgColor
        imageView.layer.shadowRadius = 8
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shouldRasterize = true
        imageView.layer.shadowOffset = CGSize(width: 0, height: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
