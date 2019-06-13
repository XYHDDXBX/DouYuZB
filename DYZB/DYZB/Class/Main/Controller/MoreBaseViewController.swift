//
//  MoreBaseViewController.swift
//  DYZB
//
//  Created by yuhangxi on 2019/6/13.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

class MoreBaseViewController: UIViewController {
    
    var  contentView:UIView?
    
    
    lazy var animeImageView:UIImageView = {[unowned self] in
        let animeImageView = UIImageView(frame: CGRect(x: 36.5, y: 0, width: 302, height: 464))
        animeImageView.animationImages = [UIImage(named: "img_loading_1")!,UIImage(named: "img_loading_2")!]
        animeImageView.autoresizingMask = [.flexibleTopMargin,.flexibleBottomMargin]
        animeImageView.animationRepeatCount = LONG_MAX
        animeImageView.animationDuration = 0.5
        return animeImageView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}


extension MoreBaseViewController{
 @objc func setupUI(){
        contentView?.isHidden = true
        view.addSubview(animeImageView)
        view.backgroundColor = UIColor(red: 250.0, green: 250.0, blue: 250.0)
        animeImageView.startAnimating()
    }
    
    func hiddenContentView(){
        //停止动画
        animeImageView.stopAnimating()
        //隐藏animeImageView
        animeImageView.isHidden = true
        //显示contentView
        contentView?.isHidden = false
    }
}



