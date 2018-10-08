//
//  SelectBackgroundController.swift
//  MotivationApp
//
//  Created by Euijae Hong on 08/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class SelectBackgroundViewController :  UIViewController {
    
    
    let layout = UICollectionViewFlowLayout()
    
    lazy var collectionView : UICollectionView = {
        
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        
        cv.registerCell(ofType: backgroundImageCell.self)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        
        
        return cv
    
        
    }()
    
    
    
    
}


//MARK:- SetupViews
extension SelectBackgroundViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
    }
    
    
    
}


//MARK:- UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension SelectBackgroundViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 8
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(with: backgroundImageCell.self, for: indexPath)
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width:100 , height: 300)
        
    }
    
}
