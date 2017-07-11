//
//  MenuBar.swift
//  H&V
//
//  Created by しんてんか on 2017/7/11.
//  Copyright © 2017年 しんてんか. All rights reserved.
//

import UIKit

class MenuBar:UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 41, green: 198, blue: 152)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellID"
    
    let icons = ["store","mapmark-w","shoppingcart","mark"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MenuBarCell
        cell.imageView.image = UIImage(named: icons[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.backgroundColor = UIColor.rgb(red: 41, green: 198, blue: 152)
        return cell
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        //注册
        collectionView.register(MenuBarCell.self, forCellWithReuseIdentifier: "cellId")
        
        backgroundColor = UIColor.rgb(red: 41, green: 198, blue: 152)
        addSubview(collectionView)
        addConstraintsWithVisualFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithVisualFormat("V:|[v0]|", views: collectionView)
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .left)
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class MenuBarCell: BaseCell{
    let imageView:UIImageView = {
    let iv = UIImageView()
        iv.image = UIImage(named: "mapmark-w")
        //上方导航按钮颜色
        iv.tintColor = UIColor.rgb(red: 0, green: 138, blue: 97)
        return iv

    }()
    
    override var isHighlighted: Bool{
        didSet{
            imageView.tintColor = isHighlighted ? UIColor.white:UIColor.rgb(red: 0, green: 138, blue: 97)
        }
    }
    
    override var isSelected: Bool{
        didSet{
            imageView.tintColor = isSelected ? UIColor.white:UIColor.rgb(red: 0, green: 138, blue: 97)
        }
    }
    
    override func setupViews() {
        addSubview(imageView)
        addConstraintsWithVisualFormat("H:[v0]", views: imageView)
        addConstraintsWithVisualFormat("V:[v0]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}
