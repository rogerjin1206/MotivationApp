//
//  SettingMemoView.swift
//  MotivationApp
//
//  Created by Euijae Hong on 12/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit

class SettingMemoView : UIView {
    
    let memoLabel : UILabel = {
        
        let l = UILabel()
        l.text = "메모"
        l.textColor = .white
        l.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 17)
        l.sizeToFit()
        l.textAlignment = .center
        
        return l
        
    }()
    
    let memoTF : UITextField = {
        
        let tf = UITextField()
        
        let attributeString = NSAttributedString(string:"무엇이 당신을 움직이게 만드나요 ?", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 155, green: 155, blue: 155), NSAttributedString.Key.font : UIFont(name: "AppleSDGothicNeo-SemiBold", size: 17)!])
        
        tf.attributedPlaceholder = attributeString
        tf.placeholder = "무엇이 당신을 움직이게 만드나요 ?"
        tf.textColor = .white
        
        
        return tf
        
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



extension SettingMemoView {
    
    fileprivate func setupViews() {
        
        [
            memoLabel,
            memoTF
        ].forEach({addSubview($0)})
        
        
        memoLabel.snp.makeConstraints{
            
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(32)
            
        }
        
        
        memoTF.snp.makeConstraints{
            
            $0.leading.equalTo(memoLabel.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().offset(-8)
            $0.centerY.equalToSuperview()
            
        }
        
    }
    
}
