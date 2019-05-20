//
//  recommendCycleView.swift
//  DYZB
//
//  Created by yuhangxi on 2019/5/13.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

private let cycleID = "cycleID"

private var cycleTimer:Timer?

class RecommendCycleView: UIView {
    
    var cycleModels:[cycleModel]?{
        didSet{
            collectionview.reloadData()
            pagecontrol.numberOfPages = cycleModels?.count ?? 0
            let indexpath = NSIndexPath(item: (cycleModels!.count) * 10, section: 0)
            collectionview.scrollToItem(at:indexpath as IndexPath, at: .left, animated:false)
            removeCycleTimer()
            addCycleTimer()
            
        }
    }
    
    
    //空间加载
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    
    @IBOutlet weak var pagecontrol: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //设置有点问题，需要解决
//        autoresizingMask = .None
        collectionview.register(UINib(nibName: "CollectionCycleViewCell", bundle:nil ), forCellWithReuseIdentifier: cycleID)
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
        
            return (cycleModels?.count ?? 0)*1000
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cycleID, for: indexPath) as! CollectionCycleViewCell
        cell.cyclemodel = self.cycleModels![indexPath.item % cycleModels!.count]
        return cell
        
        
    }
    
}

extension RecommendCycleView:UICollectionViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //计算偏移量
        let offsetX = scrollView.contentOffset.x + collectionview.bounds.width*0.5
        let currentPage = Int(offsetX/collectionview.bounds.width) % (cycleModels?.count)!
        pagecontrol.currentPage = currentPage
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeCycleTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addCycleTimer()
    }
}
//对定时器的操作方法
extension RecommendCycleView{
    func addCycleTimer(){
        cycleTimer = Timer(timeInterval: 2.0, target: self, selector: #selector(self.scorllToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: RunLoopMode.commonModes )
    }
    
    func removeCycleTimer(){
        cycleTimer?.invalidate()
        cycleTimer = nil
    }
    
    @objc func scorllToNext(){
        let offsetX = collectionview.bounds.width + collectionview.contentOffset.x
        collectionview.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
    
}






