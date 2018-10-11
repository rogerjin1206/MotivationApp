//
//  ConfigurationViewController.swift
//  MotivationApp
//
//  Created by Euijae Hong on 08/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit


class ConfigurationViewController : UIViewController {
    
    let naviLabel : UILabel = {
        
        let l = UILabel()
        l.textColor = .white
        l.text = "설정"
        
        return l
        
    }()
    
    let backButton : UIButton = {
        
        let b = UIButton()
        b.addTarget(self, action: #selector(backToAlarmVC), for: .touchUpInside)
        b.backgroundColor = .white
        b.setImage(UIImage(named:"xCircle"), for: .normal)
        b.imageView?.contentMode = .scaleAspectFit
        
        return b
        
    }()
    
    lazy var tableView : UITableView = {
        
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.registerCell(ofType:ConfigurationCell.self)

        return tv
    }()
    
}


//MARK:- Life Cycle
extension ConfigurationViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        setupViews()
    }
    
}


//MARK:- SetupViews
extension ConfigurationViewController {
    
    fileprivate func setupViews() {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
      
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        
        [
            backButton,
            naviLabel,
            tableView
        ].forEach({view.addSubview($0)})
        
        
        backButton.snp.makeConstraints({
            
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.equalToSuperview().offset(24)
            $0.size.equalTo(40)
            
            
        })
        
        naviLabel.snp.makeConstraints({
            
            $0.centerY.equalTo(backButton.snp.centerY)
            $0.centerX.equalToSuperview()
        })
        
        
        tableView.snp.makeConstraints({
            
            $0.top.equalTo(backButton.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            
        })
        
    }
    
}

//MARK:- UITableViewDelegate & UITableViewDataSource
extension ConfigurationViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueCell(ofType: ConfigurationCell.self, indexPath: indexPath)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            
            let selectBackgroundVC = SelectBackgroundViewController()
            selectBackgroundVC.modalPresentationStyle = .overCurrentContext
            self.present(selectBackgroundVC, animated: true, completion: nil)
            
        case 1:
            
            ()
            
        default:
            
            ()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    
}


//MARK:- Actions
extension ConfigurationViewController {
    
    @objc fileprivate func backToAlarmVC() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
