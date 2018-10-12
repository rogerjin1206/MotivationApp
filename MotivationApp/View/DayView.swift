//
//  DayView.swift
//  MotivationApp
//
//  Created by Euijae Hong on 11/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class DayView : UIView {
    
    let everyDayButton = UIButton()
    let weekButton = UIButton()
    let weekendButton = UIButton()
    let noneButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        backgroundColor = UIColor(red: 74, green: 74, blue: 74).withAlphaComponent(0.4)
        layer.cornerRadius = 8
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DayView {
    
    fileprivate func setupViews() {

       let buttonNames = ["매일","주중","주말","안함"]
       let buttons = [
                        everyDayButton,
                        weekButton,
                        weekendButton,
                        noneButton
                     ]
        

        for i in 0..<buttons.count {
            
            addSubview(buttons[i])
            buttons[i].tag = i
            buttons[i].setTitle(buttonNames[i], for: .normal)
            buttons[i].setTitleColor(UIColor(red: 155, green: 155, blue: 155), for: .normal)
            buttons[i].backgroundColor = .clear
            
        }
        
        
        print(frame)
        
        everyDayButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(270/4)
            $0.height.equalTo(32)
            
        }
        
        weekButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(everyDayButton.snp.trailing)
            $0.width.equalTo(270/4)
            $0.height.equalTo(32)
            
        }
        
        weekendButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(weekButton.snp.trailing)
            $0.width.equalTo(270/4)
            $0.height.equalTo(32)
            
        }
        
        noneButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(weekendButton.snp.trailing)
            $0.width.equalTo(270/4)
            $0.height.equalTo(32)
            
        }
        
        
    }
    
}
