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
    let settingDayView = SettingDayView()
    let settingSoundView = SettingSoundView()
    let settingMemoView = SettingMemoView()
    
    
    let cancelButton : UIButton = {
        
        let b = UIButton()
        b.setTitle("취소", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.textAlignment = .center
        b.titleLabel?.font = UIFont(name:"AppleSDGothicNeo-Bold", size: 17)
        b.addTarget(self, action: #selector(backToAlarmVC), for: .touchUpInside)
        
        return b
        
    }()
    
    
    let saveButton : UIButton = {
        
        let b = UIButton()
        b.setTitle("저장", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.textAlignment = .center
        b.titleLabel?.font = UIFont(name:"AppleSDGothicNeo-Bold", size: 17)
        b.addTarget(self, action: #selector(saveAlarmSetting), for: .touchUpInside)
        
        return b
        
    }()
    
    
}


//MARK:- Life Cycle
extension SettingAlarmViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIWindow.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIWindow.keyboardWillHideNotification, object: nil)
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    
    
}

//MARK:- SetupViews
extension SettingAlarmViewController {
    
    fileprivate func setupViews() {
        
        print(view.frame.origin.y)
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        
        [
            settingTimeView,
            settingDayView,
            settingSoundView,
            settingMemoView,
            cancelButton,
            saveButton
            
        ].forEach({view.addSubview($0)})
        
        
        
        settingTimeView.snp.makeConstraints{
            
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(160)
        }
        
        
        settingDayView.snp.makeConstraints{
            
            $0.top.equalTo(settingTimeView.snp.bottom).offset(8)
            $0.leading.equalTo(settingTimeView.snp.leading)
            $0.trailing.equalTo(settingTimeView.snp.trailing)
            $0.height.equalTo(110)
            
        }
        
        settingSoundView.snp.makeConstraints{
            
            $0.top.equalTo(settingDayView.snp.bottom).offset(8)
            $0.leading.equalTo(settingTimeView.snp.leading)
            $0.trailing.equalTo(settingTimeView.snp.trailing)
            $0.height.equalTo(110)

        }
        
        
        settingMemoView.snp.makeConstraints{
            
            $0.top.equalTo(settingSoundView.snp.bottom).offset(8)
            $0.leading.equalTo(settingTimeView.snp.leading)
            $0.trailing.equalTo(settingTimeView.snp.trailing)
            $0.height.equalTo(56)
            
        }
        
        cancelButton.snp.makeConstraints{
            
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(view.frame.width/2)
            $0.height.equalTo(56)
            
        }
        
        saveButton.snp.makeConstraints{
            
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(view.frame.width/2)
            $0.height.equalTo(56)
            
        }
        
        
    }
    
}


//MARK:- Actions
extension SettingAlarmViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc fileprivate func backToAlarmVC() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc fileprivate func saveAlarmSetting() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc fileprivate func keyboardWillShow(_ notification :Notification) {
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//            let keyboardRectangle = keyboardFrame.cgRectValue
//            let keyboardHeight = keyboardRectangle.height
            
            DispatchQueue.main.async {
                
                UIView.animate(withDuration: 0.15, animations: {
                    
                    self.view.frame.origin.y -= 56
                })
                
            }
            
            
        }
        
    }
    
    @objc fileprivate func keyboardWillHide(_ notification :Notification) {
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//            let keyboardRectangle = keyboardFrame.cgRectValue
//            let keyboardHeight = keyboardRectangle.height
            
            DispatchQueue.main.async {
                
                UIView.animate(withDuration: 0.15, animations: {
                    
                    self.view.frame.origin.y = 0
                })
                
            }
            
        }
        
    }
    
}

extension SettingAlarmViewController {
    
}

extension SettingAlarmViewController {
    
}
