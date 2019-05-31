//
//  ToGameView.swift
//  DYZB
//
//  Created by yuhangxi on 2019/5/31.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

private let topID = "topID"
class ToGameView: UIView {

    @IBOutlet weak var topCollectionVIew: UICollectionView!
    
    var topGames:[gameModel]?{
        didSet{
            topCollectionVIew.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topCollectionVIew.register(UINib(nibName: "GameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: topID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layer = topCollectionVIew.collectionViewLayout as! UICollectionViewFlowLayout
        layer.scrollDirection = .horizontal
    }
    
}


extension ToGameView{
    class func setUpTopGameView() -> ToGameView{
        return Bundle.main.loadNibNamed("ToGameView", owner: nil, options: nil)?.first as!ToGameView
    }
}



extension ToGameView:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topGames?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topID, for: indexPath) as! GameCollectionViewCell
        cell.topModel = topGames?[indexPath.item]
        return cell
    }
    
    
}
