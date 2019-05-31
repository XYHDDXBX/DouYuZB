//
//  RecommendGameView.swift
//  DYZB
//
//  Created by yuhangxi on 2019/5/16.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

private let gameID = "gameCell"
class RecommendGameView: UIView {
    

    @IBOutlet weak var gameCollectionView: UICollectionView!
    
    var gameGroup:[AnchoGroup]?
    {
        didSet{
            
            gameGroup?.removeFirst()
            gameGroup?.removeFirst()
            
            let more = AnchoGroup()
            more.tag_name = "更多"
            more.icon_url = "home_more_btn"
            gameGroup?.append(more)
            

            gameCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gameCollectionView.register(UINib(nibName: "GameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: gameID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layer = gameCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layer.scrollDirection = .horizontal
    }
    
}

extension RecommendGameView{
   class func setUpGameView() -> RecommendGameView{
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as!RecommendGameView
    }
}

//数据源方法
extension RecommendGameView:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameGroup?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gameID, for: indexPath) as! GameCollectionViewCell
        cell.gameModel = self.gameGroup![indexPath.item]
        return cell
        
     }
    
    }



