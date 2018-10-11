//
//  SettingAlarmViewController.swift
//  MotivationApp
//
//  Created by Euijae Hong on 10/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class SettingAlarmViewController : UIViewController {
    
    
    let settingTimeView = SettingTimeView()
    
    
    
    let cancelButton : UIButton = {
        
        let b = UIButton()
        b.setTitle("취소", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.textAlignment = .center
        b.titleLabel?.font = UIFont(name:"AppleSDGothicNeo-Bold", size: 17)
        b.addTarget(self, action: #selector(backToAlarmVC), for: .touchUpInside)
        b.backgroundColor = .red
        
        return b
    }()
    
    let saveButton : UIButton = {
        
        let b = UIButton()
        b.setTitle("저장", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.textAlignment = .center
        b.titleLabel?.font = UIFont(name:"AppleSDGothicNeo-Bold", size: 17)
        b.addTarget(self, action: #selector(saveAlarmSetting), for: .touchUpInside)
        b.backgroundColor = .red
        
        return b
    }()
    
    
}


//MARK:- Life Cycle
extension SettingAlarmViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    
}

//MARK:- SetupViews
extension SettingAlarmViewController {
    
    fileprivate func setupViews() {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        
        [
            settingTimeView,
            cancelButton,
            saveButton
            
        ].forEach({view.addSubview($0)})
        
        
        
        settingTimeView.snp.makeConstraints{
            
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        cancelButton.snp.makeConstraints{
            
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(view.frame.width/2)
            $0.height.equalTo(56)
            
        }
        
        saveButton.snp.makeConstraints{
            
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(view.frame.width/2)
            $0.height.equalTo(56)
            
        }
        
        
    }
    
}


//MARK:- Actions
extension SettingAlarmViewController {
    
    @objc fileprivate func backToAlarmVC() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc fileprivate func saveAlarmSetting() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}

extension SettingAlarmViewController {
    
}

extension SettingAlarmViewController {
    
}
