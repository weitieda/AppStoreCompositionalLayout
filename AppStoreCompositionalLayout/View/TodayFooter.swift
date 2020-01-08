//
//  TodayFooter.swift
//  AppStoreCompositionalLayout
//
//  Created by Tieda Wei on 2020-01-06.
//  Copyright © 2020 Tieda Wei. All rights reserved.
//

import UIKit
import TDTools

class TodayFooter: UICollectionReusableView {
    
    static let id = "todayfooter"
    static let kind = "todayFooterKind"
    
    let termsButton = UIButton(title: "Terms & Conditions >", titleColor: .systemGray, font: .preferredFont(forTextStyle: .callout))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let line = UIView(backgroundColor: .lightGray)
        line.constrainHeight(constant: 0.5)
        
        termsButton.contentHorizontalAlignment = .left
        
        vstack(
            UIView(),
            line,
            termsButton,
            spacing: 8
        ).fillSuperview(padding: .init(top: 0, left: 0, bottom: 8, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
