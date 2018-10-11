//
//  AlarmViewController.swift
//  MotivationApp
//
//  Created by Euijae Hong on 01/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class AlarmViewController : UIViewController {
            
    let backgroundImageView : UIImageView = {
        
        let iv = UIImageView()
        iv.image = UIImage(named: "background_1")
        
        return iv
        
    }()
    
    let menuButton : UIButton = {
        
        let b = UIButton()
        b.addTarget(self, action: #selector(goToConfigurationVC), for: .touchUpInside)
        b.backgroundColor = .yellow
        
        return b
        
    }()
    
    let createAlarmButton : UIButton = {
        
        let b = UIButton()
        b.addTarget(self, action: #selector(goToSettingAlarmVC), for: .touchUpInside)
        b.backgroundColor = .yellow
        return b
        
    }()
    
    lazy var tableView : UITableView = {
        
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.registerCell(ofType:AlarmCell.self)
        
        return tv
        
    }()
    
}



extension AlarmViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        setupViews()
        

    }
    
}


//MARK:- SetupViews
extension AlarmViewController {
    
    fileprivate func setupViews() {
        

        
        [
            backgroundImageView,
            menuButton,
            createAlarmButton,
            tableView
            
            ].forEach{view.addSubview($0)}
        
        
        backgroundImageView.snp.makeConstraints({
            
            $0.edges.equalToSuperview()
            
        })
        
        menuButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.equalToSuperview().offset(24)
            $0.size.equalTo(40)
        }
        
        createAlarmButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.size.equalTo(40)
        }
        
        
        tableView.snp.makeConstraints {
            
            $0.height.equalTo(view.frame.height/2+18)
            $0.trailing.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            
        }
    
    }
    
    
    
}


//MARK: UITableViewDelegate  & UITableViewDataSource
extension AlarmViewController : UITableViewDelegate , UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueCell(ofType: AlarmCell.self, indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 107
        
    }
    
    
}


//MARK:- Actions
extension AlarmViewController {
    
    @objc fileprivate func goToSettingAlarmVC() {
        
        let settingAlarmVC = SettingAlarmViewController()
        
        settingAlarmVC.modalPresentationStyle = .overCurrentContext
        
        self.present(settingAlarmVC, animated: true, completion: nil)
        

        
    }
    
    @objc fileprivate func goToConfigurationVC() {
        
        let configurationVC = ConfigurationViewController()
        
        configurationVC.modalPresentationStyle = .overCurrentContext
        //        selectBackgroundVC.delegate = self
        
        self.present(configurationVC, animated: true, completion: nil)
        
        
        
    }
    
}
