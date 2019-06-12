//
//  AmuseTopView.swift
//  DYZB
//
//  Created by yuhangxi on 2019/6/12.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit


let topViewID = "topViewID"
class AmuseTopView: UIView {
     
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var pageControl: UIPageControl!
    var groups:[AnchoGroup]?{
        didSet{
            collectionView.reloadData()
        }
    }
}

extension AmuseTopView{
    class func CreatAmuseTopView()->AmuseTopView{
        return Bundle.main.loadNibNamed("AmuseTopView", owner: nil, options: nil)?.first as! AmuseTopView
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "AmuseTopViewCell", bundle: nil), forCellWithReuseIdentifier: topViewID)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
     let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
     layout.itemSize = collectionView.bounds.size
    }
}


//数据源方法
extension AmuseTopView:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let num = groups?.count else{return 0}
        let pageNum = Int((num-1)/8 + 1)
        pageControl.numberOfPages = pageNum
        return pageNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topViewID, for: indexPath)as!AmuseTopViewCell
        setupCellDataWithCell(cell: cell, indexpath: indexPath)
        return cell
        
    }
    
    private func setupCellDataWithCell(cell:AmuseTopViewCell,indexpath:IndexPath){
        //  取出起始点位置
        let startindex = indexpath.item * 8
        var  endindex = (indexpath.item + 1) * 8 - 1
        // 越界问题处理
        if endindex > groups!.count - 1 {
            endindex = groups!.count - 1
        }
        var tempArr = Array(groups![startindex...endindex])
        tempArr.removeFirst()
        cell.groups = tempArr
//        cell.clipsToBounds = true
    }
    
}

extension AmuseTopView:UICollectionViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       pageControl.currentPage = Int(scrollView.contentOffset.x/collectionView.bounds.size.width)
    }
}




