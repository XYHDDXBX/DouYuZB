//
//  GameViewController.swift
//  DYZB
//
//  Created by yuhangxi on 2019/5/29.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit
import Kingfisher

private let EadgeMargen:CGFloat = 10
private let GameW:CGFloat = (kScreenW - 2*EadgeMargen)/4
private let GameH:CGFloat = GameW*6/5
private let GameID = "GameID"
private let GameHeadID = "GameHeadID"
private let headerH:CGFloat = 50
private let ScoreH:CGFloat = 90
class GameViewController: UIViewController {
    
//懒加载collectionview属性
    fileprivate lazy var gameVM:GameViewModel = GameViewModel()
    
    fileprivate lazy var scoreView:ToGameView = {
        let scoreView = ToGameView.setUpTopGameView()
//        scoreView.backgroundColor = UIColor.blue
        scoreView.frame = CGRect(x: 0, y: -ScoreH, width: kScreenW, height: ScoreH)
        return scoreView
    }()
    
    
    fileprivate lazy var topGameHeaderView:CollectionHeaderView = {
        let topGameHeaderView = CollectionHeaderView.creatHeadView()
        topGameHeaderView.frame = CGRect(x: 0, y: -(headerH + ScoreH), width: kScreenW, height: headerH)
        
        topGameHeaderView.moreBtn.isHidden = true
        topGameHeaderView.titleLabel.text = "常用"
        topGameHeaderView.iconImageView.image = UIImage(named: "Img_orange")
        return topGameHeaderView
    }()
    
    
    fileprivate lazy var gameView:UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: GameW, height: GameH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: EadgeMargen, bottom: 0, right: EadgeMargen)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: headerH)
        
       let gameView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        gameView.showsVerticalScrollIndicator = false
        gameView.dataSource = self
        gameView.register(UINib(nibName: "GameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: GameID)
        
        gameView.backgroundColor = UIColor.white
        gameView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        gameView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: GameHeadID)
        return gameView
        
    }()

//系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadData()
  }
}

extension GameViewController{
    fileprivate func setUpUI(){
        view.addSubview(gameView)
        gameView.addSubview(topGameHeaderView)
        gameView.addSubview(scoreView)
        gameView.contentInset = UIEdgeInsets(top: headerH + ScoreH, left: 0, bottom: 0, right: 0)
    }
}

extension GameViewController{
    fileprivate func loadData(){
        gameVM.loadAllGameData {
            //展示全部游戏
        self.gameView.reloadData()
            //展示常用游戏
        self.scoreView.topGames = Array(self.gameVM.games[0..<10])
        }
    }
}

extension GameViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameVM.games.count - 397
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameID, for: indexPath) as! GameCollectionViewCell
        cell.titleLable.text = gameVM.games[indexPath.item].tag_name
        
        let iconURL = NSURL(string: gameVM.games[indexPath.item].pic_name)
        let resource = ImageResource(downloadURL: iconURL! as URL)
        cell.iconImageView.kf.setImage(with: resource)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GameHeadID, for: indexPath) as! CollectionHeaderView
        headerView.moreBtn.isHidden = true
        headerView.titleLabel.text = "全部"
        headerView.iconImageView.image = UIImage(named: "Img_orange")
        return headerView
        
    }
}


