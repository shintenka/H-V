//
//  viewCell.swift
//  H&V
//
//  Created by しんてんか on 2017/7/11.
//  Copyright © 2017年 しんてんか. All rights reserved.
//

import UIKit

class BaseCell:UICollectionViewCell{
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    
}
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class HandVCell: BaseCell{
    
    
    //block
    let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //blackLine
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 160, green: 160, blue: 160)
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Onigiri (rice balls)"
        return label
        
    }()
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false
        textView.text = "HALAL・Flaked tuna mixed with mayo"
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.textColor = UIColor.rgb(red: 160, green: 160, blue: 160)
        return textView
    }()
    
    override func setupViews(){
        addSubview(separatorView)
        addSubview(foodImageView)
        addSubview(nameLabel)
        addSubview(subtitleTextView)
        
        // constraints
        addConstraintsWithVisualFormat( "H:|-10-[v0(70)]-10-[v1]-10-|", views: foodImageView,nameLabel)
        addConstraintsWithVisualFormat("V:|-13-[v0(30)]-10-|", views:nameLabel)
        
        addConstraintsWithVisualFormat("V:|-13-[v0(70)][v1(1)]|", views: foodImageView,separatorView)
        addConstraintsWithVisualFormat( "H:|-1-[v0]-1-|", views: separatorView)
        
        //subtitleTextView
        //top
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 8))
        //left
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: foodImageView, attribute: .left, multiplier: 1, constant: 80))
        //right
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: nameLabel, attribute: .right, multiplier: 1, constant: 0))
        
        //height
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem:self , attribute: .height, multiplier: 0, constant: 20))
        
    }
}




