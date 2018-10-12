//
//  CustomSlider.swift
//  MotivationApp
//
//  Created by Euijae Hong on 11/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit


class CustomSlider : UISlider {
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = super.trackRect(forBounds: bounds)
        
        newBounds.size.height = 4
        return newBounds
    }

}
