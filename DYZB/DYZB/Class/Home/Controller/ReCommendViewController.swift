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
private let kCycyleH = kScreenW*3/8
private let kGameH:CGFloat = 90


class ReCommendViewController: BaseViewController {
    
    //懒加载一个viewmodel
    private lazy var commendVM:CommendViewModel = CommendViewModel()

 
    //懒加载cycleVIew
    private lazy var cycleView:RecommendCycleView = {
        let cycleView = RecommendCycleView.setupCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycyleH + kGameH), width: kScreenW, height: kCycyleH)
        return cycleView
    }()
    
    //懒加载ganmeView
    private lazy var gameView:RecommendGameView = {
       let gameView = RecommendGameView.setUpGameView()
        gameView.frame = CGRect(x: 0, y: -kGameH, width: kScreenW, height: kGameH)
        return gameView
    }()

}
extension ReCommendViewController{
    override func setupUI() {
        super.setupUI()
        //将cycleView添加到collectionview中
        self.collectionView.addSubview(cycleView)
        //将gameView添加到collectionview中
        self.collectionView.addSubview(gameView)
        //设置collectionview的内边距
        collectionView.contentInset = UIEdgeInsets(top: kCycyleH + kGameH, left: 0, bottom: 0, right: 0)
    }
}

//加载网络数据
extension ReCommendViewController{
    override func loadData(){
        //给父类中的VM赋值
        baseVM = commendVM
        //加载推荐数据
        commendVM.loadData {
            self.collectionView.reloadData()
            self.gameView.gameGroup = self.commendVM.amuseGroups
        }
        //加载轮播数据
        commendVM.loadCycleData {
            self.cycleView.cycleModels = self.commendVM.cycleModels
        }
        
    }
}

extension ReCommendViewController:UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1{
let prettCell = collectionView.dequeueReusableCell(withReuseIdentifier: KperrtyCell, for: indexPath) as! CollectionPerrtyViewCell
    prettCell.model = commendVM.amuseGroups[indexPath.section].anchors[indexPath.item]
            return prettCell
            
        }
        return super.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
        return CGSize(width: ItemW, height: PrettyItemH)
        }
        return CGSize(width: ItemW, height: NomalItemH)

    }
}

