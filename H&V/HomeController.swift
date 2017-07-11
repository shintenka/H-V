//
//  ViewController.swift
//  H&V
//
//  Created by しんてんか on 2017/7/9.
//  Copyright © 2017年 しんてんか. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Show Label"Search"
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-30, height: view.frame.height))
        titleLabel.text = "Search"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize:20)
        navigationItem.titleView = titleLabel
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(HandVCell.self, forCellWithReuseIdentifier: "HomeCellId")
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        setupNavBarButtons()
        setupMenuBar()
        
        
    }
    
    func setupNavBarButtons(){
        let searchImage = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image:searchImage,style:.plain,target:self, action:#selector(handleSearch))
        let markImage = UIImage(named: "mark")?.withRenderingMode(.alwaysOriginal)
        let markBarButtonItem = UIBarButtonItem(image:markImage,style:.plain,target:self, action:#selector(handleMark))
        
        navigationItem.rightBarButtonItems = [markBarButtonItem, searchBarButtonItem]
    }
    
    func handleSearch(){
        print("search")
    }
    func handleMark(){
        print("mark")
    }
    let menuBar:MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    func setupMenuBar(){
        view.addSubview(menuBar)
        view.addConstraintsWithVisualFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithVisualFormat("V:|[v0(50)]|", views: menuBar)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCellId", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height/6.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
   
}
