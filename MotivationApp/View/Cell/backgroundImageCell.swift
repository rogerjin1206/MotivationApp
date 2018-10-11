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
    
    override var isSelected: Bool {
        
        didSet {
            
            isSelected ? print("true") : print("falase")
            
            if isSelected {
                
                layer.borderWidth = 5
                layer.borderColor = UIColor.white.cgColor
                
            } else {
                
                layer.borderWidth = 0
                
            }
            
        }
        
    }

    
    let imageView = UIImageView()
    
    override func initial() {
        super.initial()
        
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleToFill
        
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints({
            
            $0.edges.equalToSuperview()
            
        })
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 8
    }
    

    
}



