//
//  BaseViewController.swift
//  DYZB
//
//  Created by yuhangxi on 2019/6/4.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

private let KitemMatgin:CGFloat = 10
private let ItemW = (kScreenW - 3*KitemMatgin) / 2
private let NomalItemH = ItemW * 3 / 4
private let PrettyItemH = ItemW * 4 / 3
private let KheaderH:CGFloat = 40
private let KnomalCell = "KnomalCell"
private let KperrtyCell = "KperrtyCell"
private let KheaderView = "KheaderView"
private let kCycyleH = kScreenW*3/8
private let kGameH:CGFloat = 90

class BaseViewController: UIViewController {
    //定义属性
    var baseVM:BaseViewmodel!
    
    lazy var collectionView:UICollectionView = {[unowned self] in
        //布局layout
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = KitemMatgin
        layout.sectionInset = UIEdgeInsets(top: 0, left: KitemMatgin, bottom: 0, right: KitemMatgin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height:KheaderH)
        layout.itemSize = CGSize(width: ItemW, height: NomalItemH)
        //创建collectionview
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "CollectionNomalViewCell", bundle: nil), forCellWithReuseIdentifier: KnomalCell)
        
        collectionView.register(UINib(nibName: "CollectionPerrtyViewCell", bundle: nil), forCellWithReuseIdentifier: KperrtyCell)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: KheaderView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
        }()
    
    //系统回调属性
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
}


extension BaseViewController{
   @objc func setupUI(){
        self.view.addSubview(collectionView)
    }
}

extension BaseViewController{
   @objc func loadData(){
        
    }
}


extension BaseViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return baseVM.amuseGroups.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return baseVM.amuseGroups[section].anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KnomalCell, for: indexPath) as!CollectionNomalViewCell
        cell.model = baseVM.amuseGroups[indexPath.section].anchors[indexPath.item]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //取出headerview
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: KheaderView, for: indexPath) as! CollectionHeaderView
        headerView.backgroundColor = UIColor.white
        headerView.group = baseVM.amuseGroups[indexPath.section]
        return headerView
    }
}








