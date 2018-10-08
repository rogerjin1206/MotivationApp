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
    
    
    let rightButton = UIButton()
    let leftButton = UIButton()
    
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
        
        view.backgroundColor = .white
        
        setupViews()
        

    }
    
}


//MARK:- SetupViews
extension AlarmViewController {
    
    fileprivate func setupViews() {
        
        leftButton.backgroundColor = .yellow
        rightButton.backgroundColor = .yellow
        
        leftButton.addTarget(self, action: #selector(goToConfigurationVC), for: .touchUpInside)
//        rightButton
        
        [
            
            leftButton,
            rightButton,
            tableView
            
            ].forEach{view.addSubview($0)}
        
        leftButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.equalToSuperview().offset(24)
            $0.size.equalTo(40)
        }
        
        rightButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.size.equalTo(40)
        }
        
        
        tableView.snp.makeConstraints {
            
            $0.height.equalTo(view.frame.height/2)
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
        
        return 125
        
    }
    
    
}


//MARK:- Actions
extension AlarmViewController {
    
    @objc fileprivate func goToSelectBackgroundVC() {
        

        
    }
    
    @objc fileprivate func goToConfigurationVC() {
        
        let configurationVC = ConfigurationViewController()
        
        configurationVC.modalPresentationStyle = .overCurrentContext
        //        selectBackgroundVC.delegate = self
        
        self.present(configurationVC, animated: true, completion: nil)
        
        
        
    }
    
}
