//
//  ConfigurationCell.swift
//  MotivationApp
//
//  Created by Euijae Hong on 08/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit

class ConfigurationCell : BasicTableViewCell {
    
    let menuLabel : UILabel = {
        
        let l = UILabel()
        l.text = "배경화면 설정"
        l.textColor = .white
        l.font = UIFont(name:"AppleSDGothicNeo-SemiBold", size: 18)
        return l
        
    }()
    
    let separatorView : UIView = {
        
        let v = UIView()
        v.backgroundColor = .white
        v.alpha = 0.7
        return v
        
    }()
    
    
    let arrowImageView : UIImageView = {
        
        let iv = UIImageView()
        iv.backgroundColor = .white
        
        return iv
        
    }()
    
    override func initial() {
        super.initial()
        
        backgroundColor = .clear
        
        [
            separatorView,
            menuLabel,
            arrowImageView
            
        ].forEach({contentView.addSubview($0)})
        
        separatorView.snp.makeConstraints({
            
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            
        })
        
        
        menuLabel.snp.makeConstraints({
            
            $0.leading.equalToSuperview().offset(24)
            $0.bottom.equalTo(separatorView.snp.top).offset(-16)
            
            
        })
        
        
        arrowImageView.snp.makeConstraints({
            
            $0.centerY.equalTo(menuLabel.snp.centerY)
            $0.trailing.equalToSuperview().offset(-36)
            $0.size.equalTo(40)
        })
    }
    
}
