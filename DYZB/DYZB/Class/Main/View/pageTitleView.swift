//
//  pageTitleView.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/18.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

let kTitleLineH:CGFloat = 2
var titleLabels:[UILabel] = [UILabel]()



class pageTitleView: UIView {
    //自定义属性
    private var titles:[String]
    
    //懒加载scoreView属性
    lazy var scoreView:UIScrollView = {
        let scoreView = UIScrollView()
        scoreView.showsHorizontalScrollIndicator = false
        scoreView.scrollsToTop = false;
        scoreView.bounces = false
        return scoreView
    }()
    
    //懒加载scoreLine属性
    lazy var scoreLine:UIView = {
        let scoreLine = UIView()
        scoreLine.backgroundColor = UIColor.orange
        return scoreLine
    }()
    
    //自定义构造函数
    init(frame:CGRect,titles:[String]){
        self.titles = titles
        super.init(frame:frame)
        //设置UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension pageTitleView{
    
    private func setupUI(){
        //添加scroview
        scoreView.frame = bounds
        self.addSubview(scoreView)
        //设置lable
        setUpTitlelable()
        //设置lableLine和scoreLine
        setUpLablelineAndScoreLine()
    }
    
    private func setUpTitlelable(){
        let lableY:CGFloat = 0
        let lableW:CGFloat = bounds.size.width/CGFloat(titles.count)
        let lableH:CGFloat = bounds.size.height - kTitleLineH
        for(index,title) in titles.enumerated(){
            //创建lable
            let titleLable = UILabel()
            //设置lable属性
            titleLable.text = title
            titleLable.tag = index
            titleLable.textAlignment = .center
            titleLable.font = UIFont.systemFont(ofSize: 16.0)
            titleLable.textColor = UIColor.darkGray
            //设置lable的尺寸
            let lableX:CGFloat = lableW * CGFloat(index)
            titleLable.frame = CGRect(x: lableX, y: lableY, width: lableW, height: lableH)
            scoreView.addSubview(titleLable)
            titleLabels.append(titleLable)
        }
    }
    
    private func setUpLablelineAndScoreLine(){
        //设置lableLine
        let lableLine = UIView()
        lableLine.backgroundColor = UIColor.lightGray
        let lableH:CGFloat = 0.5
        lableLine.frame = CGRect(x: 0, y: frame.height - lableH, width: kScreenW, height: lableH)
        addSubview(lableLine)
        
        //设置scrowLine
        guard let firstLab = titleLabels.first else { return }
        firstLab.textColor = UIColor.orange
        scoreLine.frame = CGRect(x: firstLab.frame.origin.x, y: firstLab.frame.size.height-lableH , width: firstLab.frame.size.width, height: kTitleLineH)
        scoreView.addSubview(scoreLine)
        
    }


}
