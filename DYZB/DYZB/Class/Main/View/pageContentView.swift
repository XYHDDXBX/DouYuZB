//
//  pageContentView.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/18.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

private let contentCell = "contentCell"

class pageContentView: UIView {
    //定义属性
    private var childVC:[UIViewController]
    private var parentVC:UIViewController?
    
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
        colletionView.showsHorizontalScrollIndicator = false
        colletionView.isPagingEnabled = true
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
