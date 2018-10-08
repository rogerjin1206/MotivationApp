//
//  AlarmView.swift
//  MotivationApp
//
//  Created by Euijae Hong on 01/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit

class AlarmView : UIView {
    
    let ampmLabel : UILabel = {
        
        let l = UILabel()
    
        l.text = "오전"
        l.font = UIFont(name:"AppleSDGothicNeo-SemiBold", size: 22)
        l.textColor = .white
        
        return l
    }()
    
    let timeLabel : UILabel = {
        
        let l = UILabel()
        
        l.text = "07:00"
        l.font = UIFont(name:"AppleSDGothicNeo-SemiBold", size: 30)
        l.textColor = .white
        
        return l
    }()
    
    let switchView : UISwitch = {
        
        let sw = UISwitch()
        sw.onTintColor = .green
        sw.layer.zPosition = 1
        
        return sw
    }()
    
    let dayLabel : UILabel = {
        
        let l = UILabel()
        
        l.layer.zPosition = 1
        l.text = "Wake Up, 월 화 수 목 금 토 일"
        l.font = UIFont(name:"AppleSDGothicNeo-SemiBold", size: 15)
        l.textColor = .white
        
        return l
        
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 25
        self.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        setupViews()
        

        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0 , y: self.frame.height * 0.6))
        path.addLine(to: CGPoint(x: self.frame.width * 0.7 , y: self.frame.height * 0.6))
        path.addLine(to: CGPoint(x: self.frame.width * 0.75, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width,y:0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        
        let lineLayer = CAShapeLayer()
        lineLayer.path = path.cgPath
        lineLayer.lineWidth = 0.5
        let cgColor = UIColor.black.withAlphaComponent(0.5).cgColor
        
        lineLayer.fillColor =  cgColor
        lineLayer.strokeColor = cgColor
        
        self.layer.addSublayer(lineLayer)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlarmView {
    
    fileprivate func setupViews() {
        
        [
            ampmLabel,
            timeLabel,
            switchView,
            dayLabel
        ].forEach({addSubview($0)})

        
        ampmLabel.snp.makeConstraints{
            
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(15)
            
        }
        
        timeLabel.snp.makeConstraints{
            
            $0.centerY.equalTo(ampmLabel.snp.centerY)
            $0.leading.equalTo(ampmLabel.snp.trailing).offset(8)
            
        }
        
        switchView.snp.makeConstraints{
            $0.right.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(10)
        }
        
        dayLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-10)
            $0.left.equalToSuperview().offset(20)
        }
    
    }
    
}
