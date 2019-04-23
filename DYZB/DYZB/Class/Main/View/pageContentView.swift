//
//  pageContentView.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/18.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

protocol pageContentViewDelagete : class {
    func pagecontentView(view:pageContentView,progress:CGFloat,sourceindex:Int,targetIndex:Int)
}

private let contentCell = "contentCell"
private var StartOffsetX:CGFloat = 0

class pageContentView: UIView {
    //定义属性
    private var childVC:[UIViewController]
    private weak var parentVC:UIViewController?
    private var isForbidScrollDelegate:Bool = false
    weak var delaget:pageContentViewDelagete?
    
    //懒加载定义collectionView属性
    lazy var collectionView:UICollectionView = {[weak self] in
        //创建layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        //创建UICollectionView
        let colletionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        colletionView.dataSource = self
        colletionView.delegate = self
        colletionView.showsHorizontalScrollIndicator = false
        colletionView.isPagingEnabled = true
        //不实现弹簧效果
        colletionView.bounces = false
        colletionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: contentCell)
        return colletionView
    }()
    
    //定义构造函数
    init(frame:CGRect,childVC:[UIViewController],parentVC:UIViewController?) {
        self.childVC = childVC
        self.parentVC = parentVC
        super.init(frame: frame)
        //设置collectionView的UI
        setUpCollectionUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCollectionUI(){
        //将所有的子控制器添加到父控制器中
        for childvc in childVC {
            parentVC?.addChildViewController(childvc)
        }
        //2.添加UICollectionVIew
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

//代理方法
extension pageContentView:UICollectionViewDelegate{
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
       isForbidScrollDelegate = false
        StartOffsetX = scrollView.contentOffset.x
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //判断是否是点击事件
        if isForbidScrollDelegate {return}
    //定义需要获取的数据
        var progress:CGFloat = 0
        var sourceIndex:Int = 0
        var targetIndex:Int = 0
    //判断滑动方向
        let endOffsetX = scrollView.contentOffset.x
        let Witdh = scrollView.bounds.width
        
        if StartOffsetX > endOffsetX {//右滑
            progress = 1 - ((endOffsetX / Witdh) - floor(endOffsetX / Witdh))
            targetIndex = Int(endOffsetX / Witdh)
            sourceIndex = targetIndex + 1
            if sourceIndex >= childVC.count{
                sourceIndex = childVC.count - 1
            }
            if StartOffsetX - endOffsetX == Witdh{
                progress = 1
                sourceIndex = targetIndex
            }
        }else{//左滑
            progress = endOffsetX / Witdh - floor(endOffsetX / Witdh)
            sourceIndex = Int(endOffsetX / Witdh)
            targetIndex = sourceIndex + 1
            if targetIndex >= childVC.count{
                targetIndex = childVC.count - 1
            }
            if endOffsetX - StartOffsetX == Witdh{
                progress = 1
                targetIndex = sourceIndex
            }
            
        }
        //传递获取的数据
        delaget?.pagecontentView(view: self, progress: progress, sourceindex: sourceIndex, targetIndex: targetIndex)
    }
}


//数据源方法
extension pageContentView:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVC.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //创建cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCell, for: indexPath)
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        //给cell的内容赋值
        let childvc = childVC[indexPath.item]
        childvc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childvc.view)
        return cell
    }
}

//对外暴露的方法
extension pageContentView{
    func setupX(index:Int)  {
        isForbidScrollDelegate = true
        let offsetX = CGFloat(index) * collectionView.frame.size.width
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
    }
}





