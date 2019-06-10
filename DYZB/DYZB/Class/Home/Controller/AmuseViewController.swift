//
//  AmuseViewController.swift
//  DYZB
//
//  Created by yuhangxi on 2019/5/31.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit


class AmuseViewController: BaseViewController {

    lazy var amuseVM:AmuseViewModel = AmuseViewModel()

}


extension AmuseViewController{
    override func loadData() {
        baseVM = amuseVM
        amuseVM.loadAmuseData {
            self.collectionView.reloadData()
        }
    }
}







