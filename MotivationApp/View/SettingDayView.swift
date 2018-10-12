//
//  SettingDayView.swift
//  MotivationApp
//
//  Created by Euijae Hong on 11/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


/*

 0 = 매일
 1 = 주중
 2 = 주말
 3 = 안함
 
 */

class SettingDayView : UIView {
    
    let repeatButton : UIButton = {
        
        let b = UIButton()
        
        b.setTitle("반복", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = UIFont(name:"AppleSDGothicNeo-SemiBold", size: 17)
        
        return b
        
    }()
    
    let dayView = DayView()

    lazy var stackView : UIStackView = {
        
        let sv = UIStackView(arrangedSubviews: createDayButtons())
        sv.axis = .horizontal
        sv.distribution = .equalSpacing
        sv.alignment = .center
        
        return sv
        
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


//MARK:- SetupViews
extension SettingDayView {
    
    fileprivate func setupViews() {
        
        [
            repeatButton,
            dayView,
            stackView
            
        ].forEach({addSubview($0)})
        
        repeatButton.snp.makeConstraints {
            
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(16)
            
        }
    
        dayView.snp.makeConstraints{
            
            $0.top.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.equalTo(270)
            $0.height.equalTo(32)
            
        }
        
        stackView.snp.makeConstraints {
            
            $0.top.equalTo(dayView.snp.bottom)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview()
            
            
        }
  
    }
    
    fileprivate func createDayButtons() -> [UIButton] {
        
        let days = ["월","화","수","목","금","토","일"]
        
        var dayButtons = [UIButton]()
        
        for i in 0..<days.count {
            
            let b = UIButton()
            b.tag = i
            b.setTitle(days[i], for: .normal)
            b.setTitleColor(.white, for: .normal)
            b.titleLabel?.font = UIFont(name:"AppleSDGothicNeo-SemiBold", size: 17)
            b.backgroundColor = UIColor(red: 74, green: 74, blue: 74)
            b.snp.makeConstraints{
                $0.size.equalTo(32)
            }
            
            b.layer.cornerRadius = 16
            
            dayButtons.append(b)
            
        }
        
        
        return dayButtons
        
    }
    
    
    

}
