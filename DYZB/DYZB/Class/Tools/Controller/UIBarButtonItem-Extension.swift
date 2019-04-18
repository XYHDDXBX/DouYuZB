//
//  UIBarButtonItem-Extension.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/18.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    /*
    class  func creatitem(image:String,heightImage:String,size:CGSize) -> UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named:image), for: .normal)
        btn.setImage(UIImage(named: heightImage), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        let item = UIBarButtonItem(customView: btn)
        return item
    }
    */
    //遍历构造函数 1>以convenience关键字开头，2>在构造函数中必须明确调用一个设计的构造函数并且用self调用
    convenience init(image:String,heightImage:String,size:CGSize) {
        let btn = UIButton()
        btn.setImage(UIImage(named:image), for: .normal)
        btn.setImage(UIImage(named: heightImage), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        self.init(customView:btn)
    }
}

