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




class SettingDayView : UIView {
    
    
    var selectedDay = [Int]() {
        
        didSet{
            
            checkRepeatInterval()
            
        }
        
    }
    
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
            
            b.tag = i+1
            b.setTitle(days[i], for: .normal)
            b.setTitleColor(.white, for: .normal)
            b.titleLabel?.font = UIFont(name:"AppleSDGothicNeo-SemiBold", size: 17)
            b.backgroundColor = UIColor(red: 74, green: 74, blue: 74)
            b.addTarget(self, action: #selector(tappedDaysButton), for: .touchUpInside)
            
            b.snp.makeConstraints{
                
                $0.size.equalTo(32)
            }
            
            b.layer.cornerRadius = 16
            
            dayButtons.append(b)
            
        }
        
        return dayButtons
        
    }
    
    
    fileprivate func checkRepeatInterval() {
        
        let everyDay = [1,2,3,4,5,6,7]
        let week = [1,2,3,4,5]
        let weekend = [6,7]
        
        let sortedSelectedDay = self.selectedDay.sorted()
        
        switch sortedSelectedDay {

        case everyDay:

            self.dayView.everyDayButton.setTitleColor(.red, for: .normal)

        case week:

            self.dayView.weekButton.setTitleColor(.red, for: .normal)

        case weekend:
            
            self.dayView.weekendButton.setTitleColor(.red, for: .normal)

        default:
            
            self.dayView.everyDayButton.setTitleColor(UIColor(red: 155, green: 155, blue: 155), for: .normal)
            self.dayView.weekButton.setTitleColor(UIColor(red: 155, green: 155, blue: 155), for: .normal)
            self.dayView.weekendButton.setTitleColor(UIColor(red: 155, green: 155, blue: 155), for: .normal)
            
            break
        }
  
    }

}

extension SettingDayView {
    
    @objc func tappedDaysButton(sender:UIButton) {
        
        switch sender.tag {
            
        case 1,2,3,4,5,6,7:
            
            if sender.isSelected {
                
                if let removeIndex = selectedDay.firstIndex(of:sender.tag) {
                    
                    selectedDay.remove(at: removeIndex)
                    
                }
                
                sender.backgroundColor = UIColor(red: 74, green: 74, blue: 74)
                sender.isSelected = false
                

                
            } else {
                
                self.selectedDay.append(sender.tag)
                sender.backgroundColor = UIColor.pointColor
                sender.isSelected = true
                
            }

        default:
            break
        }
  
    }
    
    
    /*
     
     0 = 매일
     1 = 주중
     2 = 주말
     3 = 안함
     
     */
    
    @objc func tappedIntervalButton(sender:UIButton) {
        
        switch sender.tag {
            
        case 0:
            
            self.dayView.everyDayButton.setTitleColor(.red, for: .normal)
            
            
        case 1:
            
        case 2:
            
        case 3:
            
        default:
            
            break
        }
        
    }
    
}


