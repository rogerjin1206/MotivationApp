//
//  SettingSound.swift
//  MotivationApp
//
//  Created by Euijae Hong on 11/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class SettingSoundView : UIView {
    
    
    
    let soundLabel : UILabel = {
        
        let l = UILabel()
        l.text = "동기부여 사운드"
        l.font = UIFont(name:"AppleSDGothicNeo-SemiBold", size: 17)
        l.textColor = .white
        
        
        return l
        
    }()
    
    let soundImageView : UIImageView = {
        
        let iv = UIImageView()
        iv.backgroundColor = .white
        return iv
        
    }()
    
    let soundSlider : CustomSlider = {
        
        let s = CustomSlider()
        s.minimumTrackTintColor = UIColor.pointColor
        
        return s
        
    }()
    
    
    let vibrationButton : UIButton = {
        
        let b = UIButton()
        b.backgroundColor = .white
        
        
        return b
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



extension SettingSoundView {
    
    fileprivate func setupViews() {
        
        [
            soundLabel,
            soundImageView,
            soundSlider,
            vibrationButton
            
        ].forEach({addSubview($0)})
        
        
        soundLabel.snp.makeConstraints{
            
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
            
        }
        
        soundImageView.snp.makeConstraints{
            
            $0.top.equalTo(soundLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(24)
            
        }
        
        soundSlider.snp.makeConstraints{
            
            $0.centerY.equalTo(soundImageView.snp.centerY)
            $0.leading.equalTo(soundImageView.snp.trailing).offset(24)
            $0.width.equalTo(140)
            
        }

        
        vibrationButton.snp.makeConstraints{
            
            $0.centerY.equalTo(soundImageView.snp.centerY)
            $0.leading.equalTo(soundSlider.snp.trailing).offset(24)
            $0.size.equalTo(40)
            
        }
   
    }
    
}

