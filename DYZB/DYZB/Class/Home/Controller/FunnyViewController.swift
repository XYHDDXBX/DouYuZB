//
//  FunnyViewController.swift
//  DYZB
//
//  Created by yuhangxi on 2019/6/13.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

class FunnyViewController: BaseViewController {

    lazy var funnyVM:FunnyViewModel = FunnyViewModel()
    
}

extension FunnyViewController{
    override func loadData() {
        baseVM = funnyVM
        funnyVM.loadFunnydata {
           self.collectionView.reloadData()
           self.hiddenContentView()
        }
        
    }
    
    override func setupUI() {
        contentView = collectionView
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize.zero
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        super.setupUI()
        
    }
}
