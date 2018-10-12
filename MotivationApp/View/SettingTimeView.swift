//
//  SettingTimeView.swift
//  MotivationApp
//
//  Created by Euijae Hong on 10/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit

class SettingTimeView : UIView {
    
    let afterTimeButton : UIButton = {
        
        let b = UIButton()
        b.isUserInteractionEnabled = false
        b.setTitle(("7시간 30분 후에 울림"), for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = UIFont(name:"AppleSDGothicNeo-SemiBold", size: 14)
        b.backgroundColor = UIColor(red: 74, green: 74, blue: 74).withAlphaComponent(0.4)
        b.layer.cornerRadius = 8
//        b.imageView?.image = UIImage(named: <#T##String#>)
//        b.contentEdgeInsets = UIEdgeInsets(top: <#T##CGFloat#>, left: <#T##CGFloat#>, bottom: <#T##CGFloat#>, right: <#T##CGFloat#>)
        
        
        return b
        
    }()
    
    
    lazy var timePickerView : UIPickerView = {
        
        let pv = UIPickerView()
        
        pv.delegate = self
        pv.dataSource = self
        pv.backgroundColor = .black
        
        
        return pv
        
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

extension SettingTimeView {
    
    fileprivate func setupViews() {
        
        [
            afterTimeButton,
            timePickerView
            
        ].forEach({ self.addSubview($0)})
        
        afterTimeButton.snp.makeConstraints({
            
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
            $0.height.equalTo(32)
            
        })
        
        timePickerView.snp.makeConstraints({
            
            $0.top.equalTo(afterTimeButton.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-16)
        })
        
    }
    
}

extension SettingTimeView {
    
}

extension SettingTimeView {
    
}



//MARK:- UIPickerViewDelegate & UIPickerViewDataSource
extension SettingTimeView : UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 3
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
        case 0:
            
            return 11
            
        case 1:
            
            return 60
            
        case 2:
            
            return 2
            
        default:
            
            return 0
            
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        var str = ""
        
        switch component {
            
        case 0:
            
            str = String(row+1)
            let attributedString = NSAttributedString(string:str , attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
            return attributedString
            
        case 1:
            
            if row < 10 {
                
                str = "0\(row)"
                let attributedString = NSAttributedString(string:str , attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
                return attributedString
                
            } else {
                str = String(row)
                let attributedString = NSAttributedString(string:str , attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
                return attributedString
                
            }
            
        case 2:
            
            if row == 0 {
                str = "AM"
                let attributedString = NSAttributedString(string:str , attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
                return attributedString
                
            } else {
                str = "PM"
                let attributedString = NSAttributedString(string:str , attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
                return attributedString
                
            }
            
        default:
            let attributedString = NSAttributedString(string:str , attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
            return attributedString
        }

    }
  
}
