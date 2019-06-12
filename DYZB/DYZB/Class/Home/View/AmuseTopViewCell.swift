//
//  AmuseTopViewCell.swift
//  DYZB
//
//  Created by yuhangxi on 2019/6/12.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

private let InTopcell = "InTopcell"
class AmuseTopViewCell: UICollectionViewCell {

    @IBOutlet weak var incollectionview: UICollectionView!
    var groups:[AnchoGroup]?{
        didSet{
            incollectionview.reloadData()
        }
    }
    
    
}

extension AmuseTopViewCell{
    override func layoutSubviews() {
        super.layoutSubviews()
incollectionview.register(UINib(nibName:"GameCollectionViewCell" , bundle: nil), forCellWithReuseIdentifier: InTopcell)
        let layout = incollectionview.collectionViewLayout as! UICollectionViewFlowLayout
        let cellW = incollectionview.bounds.size.width/4
        let cellH = incollectionview.bounds.size.height/2
        layout.itemSize  = CGSize(width: cellW, height: cellH)
        layout.scrollDirection = .horizontal
        
        
    }
}


extension AmuseTopViewCell:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InTopcell, for: indexPath) as! GameCollectionViewCell
        cell.gameModel = groups![indexPath.item]
        cell.clipsToBounds = true
        return cell
        
    }
}
