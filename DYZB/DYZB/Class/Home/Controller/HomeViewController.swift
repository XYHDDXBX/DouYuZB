//
//  HomeViewController.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/18.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

let kPageViewH:CGFloat = 40


class HomeViewController: UIViewController {
    //懒加载titleview属性
    lazy var pagetitleView:pageTitleView = { [weak self] in
        
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleframe = CGRect(x: 0, y: kStatusBarH + kNavgationBarH, width:kScreenW, height: kPageViewH)
        let titleView = pageTitleView(frame: titleframe, titles: titles)
        titleView.delagate = self
        return titleView
        
    }()
    
    
    //懒加载pageContentView属性
    lazy var pagecontentView:pageContentView = {[weak self] in
        //确定内容的frame
        let pageViewFrame = CGRect(x: 0, y: kStatusBarH + kNavgationBarH + kPageViewH, width: kScreenW, height: kScreenH - kStatusBarH - kNavgationBarH - kPageViewH - ktabBarH)
        //确定所有的子控制器
        var childVCs = [UIViewController]()
        childVCs.append(ReCommendViewController())
        childVCs.append(GameViewController())
        childVCs.append(AmuseViewController())
        childVCs.append(FunnyViewController())
//        for _ in 0..<1{
//            let vc = UIViewController()
//            childVCs.append(vc)
//            vc.view.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255)), green: CGFloat(arc4random_uniform(255)), blue: CGFloat(arc4random_uniform(255)))
//        }
        let contentView = pageContentView(frame: pageViewFrame, childVC: childVCs, parentVC: self)
        contentView.delaget = self
        return contentView
    }()
    //系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupUI()
        
        
    }
}

extension HomeViewController{
    
    //设置UI
    private func setupUI(){
        //设置导航栏
        setupNav()
        //设置titleView
        view.addSubview(pagetitleView)
        //设置pageContentView
        view.addSubview(pagecontentView)
    }
    
    //设置导航栏
    private func setupNav(){
        /*
        //设置左边按钮
        let btn = UIButton()

        btn.setImage(UIImage(named: "logo"), for: .normal)
        btn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        //设置右边按钮
        let historyItem = setupBarBtn(image: "image_my_history", heightImage: "Image_my_history_click", size: size)

        let searchItem = setupBarBtn(image: "btn_search", heightImage: "Image_my_history_click", size: size)
        let qrcodeItem = setupBarBtn(image: "Image_scan", heightImage: "Image_scan_click", size: size)
        */
        
        //设置成不需要调整内边距
        automaticallyAdjustsScrollViewInsets = false
        //设置左边按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: "logo", heightImage: "", size: CGSize.zero)
        //设置右边按钮
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(image: "image_my_history", heightImage: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(image: "btn_search", heightImage: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(image: "Image_scan", heightImage: "Image_scan_click", size: size)
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }
    
    private func setupBarBtn(image:String,heightImage:String,size:CGSize) -> UIBarButtonItem{
        let btn = UIButton()
        btn.setImage(UIImage(named:image), for: .normal)
        btn.setImage(UIImage(named: heightImage), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        let item = UIBarButtonItem(customView: btn)
        return item
    }
    
    
}

//遵守titleViewDelagete
extension HomeViewController:pageTitleViewDelegate{
    func pagetitleView(title: pageTitleView, seleIndex index: Int) {
        self.pagecontentView.setupX(index: index)
    }
}

//遵守pagecontentViewDelagate
extension HomeViewController:pageContentViewDelagete{
    func pagecontentView(view: pageContentView, progress: CGFloat, sourceindex: Int, targetIndex: Int) {
        self.pagetitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceindex, targetIndex: targetIndex)
    }
}
