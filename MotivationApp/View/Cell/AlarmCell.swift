//
//  AlarmCell.swift
//  MotivationApp
//
//  Created by Euijae Hong on 01/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit

class AlarmCell : BasicTableViewCell  {
    
    
    let alarmView = AlarmView()

    
    
    override func initial() {
        super.initial()
        
        backgroundColor = .clear
        setupViews()
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let frame = self.contentView.frame.inset(by:UIEdgeInsets(top: 10, left: 24, bottom: 0, right: 24))
        self.contentView.frame = frame
        self.contentView.backgroundColor = .clear
        self.contentView.layer.cornerRadius = 25
    
    }
    
}




extension AlarmCell {
    
    fileprivate func setupViews() {
        
        [
            alarmView
            
            

        ].forEach{contentView.addSubview($0)}
        
        alarmView.snp.makeConstraints({
            
            $0.edges.equalToSuperview()
            
        })
        
        
        
        
        
    }
    
}
