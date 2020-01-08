//
//  TodayHeader.swift
//  AppStoreCompositionalLayout
//
//  Created by Tieda Wei on 2020-01-06.
//  Copyright © 2020 Tieda Wei. All rights reserved.
//

import UIKit
import TDTools

class TodayHeader: UICollectionReusableView {
    
    static let id = "todayheader"
    static let kind = "todayHeaderKind"
    
    let dateLabel = UILabel(text: "MONDAY, JANURARY 6", font: .boldSystemFont(ofSize: 14), numberOfLines: 1, textColor: .systemGray)
    
    let todayLabel = UILabel(text: "Today", font: .systemFont(ofSize: 34, weight: .bold), numberOfLines: 1, textColor: .label)
    let avartarImgView = UIImageView(backgroundColor: .red)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .blue
        avartarImgView.constrainWidth(constant: 44)
        avartarImgView.layer.cornerRadius = 22
        
        vstack(
            dateLabel,
            hstack(todayLabel, UIView(), avartarImgView),
            spacing: 4
        ).fillSuperview(padding: .init(top: 8, left: 0, bottom: 4, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
