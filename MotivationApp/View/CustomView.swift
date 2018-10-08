//
//  CustomView.swift
//  MotivationApp
//
//  Created by Euijae Hong on 28/09/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import AVFoundation

class CustomView : UIView {
    
    let playerButton : UIButton = {
        
        let b = UIButton()
        b.setTitle("재생", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.backgroundColor = .red
        
        return b
    }()
    
    let recoderButton : UIButton = {
        
        let b = UIButton()
        b.setTitle("녹음", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.backgroundColor = .red
        
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//MARK:- SetupView
extension CustomView {
    
    fileprivate func setupViews() {
        
        [
            recoderButton,
            playerButton
        ].forEach{self.addSubview($0)}
        
        recoderButton.snp.makeConstraints {
            
            $0.center.equalToSuperview()
            $0.size.equalTo(50)
            
        }
        
        playerButton.snp.makeConstraints{
            
            $0.trailing.equalTo(recoderButton.snp.leading).offset(-24)
            $0.centerY.equalTo(recoderButton.snp.centerY)
            $0.size.equalTo(50)
            
        }
  
    }
    

}



