//
//  recommendCycleView.swift
//  DYZB
//
//  Created by yuhangxi on 2019/5/13.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

private let cycleID = "cycleID"

class RecommendCycleView: UIView {
    
    //空间加载
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    
    @IBOutlet weak var pagecontrol: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //设置有点问题，需要解决
//        autoresizingMask = .None
        collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cycleID)
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layer = collectionview.collectionViewLayout as! UICollectionViewFlowLayout
        layer.minimumLineSpacing = 0
        layer.minimumInteritemSpacing = 0
        layer.scrollDirection = .horizontal
        
        layer.itemSize = collectionview.bounds.size
        
    }

}

//快速创建类的方法
extension RecommendCycleView{
    class func setupCycleView() -> RecommendCycleView{
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
        
    }
}

//加载数据源
extension RecommendCycleView:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return 6
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cycleID, for: indexPath)
        if indexPath.item % 2 == 0 {
            cell.backgroundColor = UIColor.red
        }else{
            cell.backgroundColor = UIColor.green
        }
        return cell
        
        
    }
    
}


