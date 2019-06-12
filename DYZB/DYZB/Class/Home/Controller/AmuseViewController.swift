//
//  AmuseViewController.swift
//  DYZB
//
//  Created by yuhangxi on 2019/5/31.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

private let KtopViewH:CGFloat = 200

class AmuseViewController: BaseViewController {

    lazy var amuseVM:AmuseViewModel = AmuseViewModel()
    lazy var amuseTopView:AmuseTopView = {
       let amuseTopView = AmuseTopView.CreatAmuseTopView()
        amuseTopView.frame = CGRect(x: 0, y: -KtopViewH, width: kScreenW, height: KtopViewH)
       return amuseTopView
    }()
}


extension AmuseViewController{
    override func loadData() {
        baseVM = amuseVM
        amuseVM.loadAmuseData {
            self.collectionView.reloadData()
            self.amuseTopView.groups = self.amuseVM.amuseGroups
        }
    }
    
    override func setupUI() {
        super.setupUI()
        collectionView.addSubview(amuseTopView)
        collectionView.contentInset = UIEdgeInsets(top: KtopViewH, left: 0, bottom: 0, right: 0)
    }
}







