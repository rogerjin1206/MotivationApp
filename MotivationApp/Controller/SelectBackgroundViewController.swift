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
    
    //
    var images : [UIImage] {
        
        var imageArray = [UIImage]()
        
        for i in 1...10 {
            
            guard let image = UIImage(named:"background_\(i)") else { return [UIImage()]}
            imageArray.append(image)
            
        }
        
        return imageArray
    }
    
    var selectedImage = UIImage()
    
    
    
    let backButton : UIButton = {
        
        let b = UIButton()
        b.backgroundColor = .white
        b.addTarget(self, action: #selector(backToConfigurationVC), for: .touchUpInside)
        
        return b

    }()


    let saveButton : UIButton = {
        
        let b = UIButton()
        b.setTitle("저장", for: .normal)
        b.setTitleColor(.white, for: .normal)
        
        return b

    }()
    
    
    
    
    lazy var collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 24
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.registerCell(ofType: backgroundImageCell.self)
        cv.allowsMultipleSelection = false
        cv.allowsSelection = true
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        
        return cv
    
        
    }()
    
    
    
    
}


//MARK:- Life Cycle
extension SelectBackgroundViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        setupViews()
        
    }
    
    
    
}


//MARK:- SetupViews()
extension SelectBackgroundViewController {
    
    fileprivate func setupViews() {
        
        
        [
            backButton,
            saveButton,
            collectionView
            
        ].forEach({view.addSubview($0)})
        
        
        backButton.snp.makeConstraints({
            
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.equalToSuperview().offset(24)
            $0.size.equalTo(40)
            
        })
        
        saveButton.snp.makeConstraints({
            
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.size.equalTo(40)
            
        })
        
        
        
        collectionView.snp.makeConstraints({

            $0.top.equalTo(backButton.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()

        })
    }
    
}

//MARK:- Private Func

extension SelectBackgroundViewController {
 
    
}


//MARK:- UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension SelectBackgroundViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return 10
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(with: backgroundImageCell.self, for: indexPath)
        
        cell.imageView.image = self.images[indexPath.item]
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.collectionView.frame.width - 24 * 3)/2
//        let heigth = width * 16/9
        
        
        return CGSize(width:150 , height: 210)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let padding = (self.collectionView.frame.width - 150*2)/3
        print(padding)
        return UIEdgeInsets(top: 24, left: padding, bottom: 0, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.selectedImage = images[indexPath.item]
    
    }

}

//MARK:- Actions
extension SelectBackgroundViewController {
    
    @objc fileprivate func backToConfigurationVC() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
