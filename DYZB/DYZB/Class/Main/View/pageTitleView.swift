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
private var lableIndex:Int = 0


//定义代理
protocol pageTitleViewDelegate : class  {
    
    func pagetitleView(title:pageTitleView,seleIndex index:Int)
    
}


class pageTitleView: UIView {
    //自定义属性
    private var titles:[String]
    //定义代理属性
    weak var delagate:pageTitleViewDelegate?
    
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
        scoreLine.backgroundColor  = UIColor(red: 255, green: 165, blue: 0)
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
            titleLable.textColor = UIColor(red: 169, green: 169, blue: 169)
            //设置lable的尺寸
            let lableX:CGFloat = lableW * CGFloat(index)
            titleLable.frame = CGRect(x: lableX, y: lableY, width: lableW, height: lableH)
            scoreView.addSubview(titleLable)
            titleLabels.append(titleLable)
            
            //给lable添加点击方法
            titleLable.isUserInteractionEnabled = true;
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLableClick(tapGes:)))
            
            titleLable.addGestureRecognizer(tapGes)
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
        firstLab.textColor = UIColor(red: 255, green: 165, blue: 0)
        scoreLine.frame = CGRect(x: firstLab.frame.origin.x, y: firstLab.frame.size.height-lableH , width: firstLab.frame.size.width, height: kTitleLineH)
        scoreView.addSubview(scoreLine)
        
        
        
        
    }


}

extension pageTitleView{
   @objc private func titleLableClick(tapGes:UITapGestureRecognizer){
    
        //获取当前的lable
    guard let currentLable = tapGes.view as? UILabel else{return}
    if currentLable.tag == lableIndex {
        return
    }
        //获取之前的lable
    let oldLabel = titleLabels[lableIndex]
        //改变文字切换的颜色
    currentLable.textColor = UIColor(red: 255, green: 165, blue: 0)
    oldLabel.textColor = UIColor(red: 169, green: 169, blue: 169)
        //保存最新的lable值到index
    lableIndex = currentLable.tag
        //改变titleLine的偏移量
    let newX = scoreLine.frame.size.width * CGFloat(lableIndex)
    UIView.animate(withDuration: 0.15) {
        self.scoreLine.frame.origin.x = newX
    }
        //通知代理
   delagate?.pagetitleView(title: self, seleIndex: lableIndex)
    
    }
}

//对外暴露的方法
extension pageTitleView{
    func setTitleWithProgress(progress:CGFloat,sourceIndex:Int,targetIndex:Int){
    //取出sourceLable和targetLable
        let sourceLabel = titleLabels[sourceIndex]
        let targetLabel = titleLabels[targetIndex]
let movetotleX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = movetotleX * progress
        scoreLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        sourceLabel.textColor = UIColor(red: 255-86*progress, green: 165 + 4*progress, blue: 169*progress)
        targetLabel.textColor = UIColor(red: 169 + 86*progress, green: 169-4*progress, blue: 169-169*progress)
        
        /*
        if sourceIndex > targetIndex || progress != 1 {//右滑
            SouLabel = sourceLabel
            Tarlable = targetLabel
            
            SouLabel.textColor = UIColor(red: 255-86*progress, green: 165 + 4*progress, blue: 169*progress)
            Tarlable.textColor = UIColor(red: 169 + 86*progress, green: 169-4*progress, blue: 169-169*progress)
            
            
        }else if sourceIndex < targetIndex || progress != 1{//左滑
            SouLabel = sourceLabel
            Tarlable = targetLabel
            SouLabel.textColor = UIColor(red: 255-86*progress, green: 165 + 4*progress, blue: 169*progress)
            Tarlable.textColor = UIColor(red: 169 + 86*progress, green: 169-4*progress, blue: 169-169*progress)
        }else{
            SouLabel.textColor = UIColor.darkGray
            Tarlable.textColor = UIColor.orange
        }
        */
        lableIndex = targetIndex
    }
}




