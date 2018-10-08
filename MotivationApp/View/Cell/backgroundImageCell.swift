//
//  backgroundImageCell.swift
//  MotivationApp
//
//  Created by Euijae Hong on 08/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class backgroundImageCell : BasicCollectionViewCell {
    
    let imageView = UIImageView()
    
    override func initial() {
        super.initial()
        
        imageView.backgroundColor = .red
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints({
            
            $0.edges.equalToSuperview()
            
        })
    }
    
}



