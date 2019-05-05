//
//  ReCommendViewController.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/23.
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

class ReCommendViewController: UIViewController {
    
    //懒加载一个viewmodel
    private lazy var commendVM:CommendViewModel = CommendViewModel()
    
    
    //懒加载添加一个UICollectionView
    lazy var collectionView:UICollectionView = {[unowned self] in
        //布局layout
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = KitemMatgin
        layout.sectionInset = UIEdgeInsets(top: 0, left: KitemMatgin, bottom: 0, right: KitemMatgin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height:KheaderH)
        
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
 
    //系统的回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadData()
    }
    

}
extension ReCommendViewController{
    private func setUpUI(){
        self.view.addSubview(collectionView)
        
    }
}

//加载网络数据
extension ReCommendViewController{
    private func loadData(){
       commendVM.loadData()
    }
}



//遵循UICollectionViewDataSouce协议
extension ReCommendViewController:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }else{
            return 4
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell:UICollectionViewCell
        
        if indexPath.section == 1 {
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: KperrtyCell, for: indexPath)
        }else{
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: KnomalCell, for: indexPath)
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //取出headerview
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: KheaderView, for: indexPath)
        headerView.backgroundColor = UIColor.white
        return headerView
    }
}


//遵循UICollectionViewDelagate协议
extension ReCommendViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemSize:CGSize
        
        if indexPath.section == 1 {
        itemSize = CGSize(width: ItemW, height: PrettyItemH)
        }else{
        itemSize = CGSize(width: ItemW, height: NomalItemH)
        }
        return itemSize
    }
}
