//
//  Extensions.swift
//  H&V
//
//  Created by しんてんか on 2017/7/11.
//  Copyright © 2017年 しんてんか. All rights reserved.
//

import UIKit


extension UIView{
    func addConstraintsWithVisualFormat(_ format:String, views: UIView...) {
        var viewsDict = [String: UIView]()
        
        for (index,view) in views.enumerated(){
            let key = "v\(index)"
            viewsDict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views:viewsDict))
    }
    
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
