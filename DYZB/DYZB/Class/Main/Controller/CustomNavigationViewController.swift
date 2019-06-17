//
//  CustomNavigationViewController.swift
//  DYZB
//
//  Created by yuhangxi on 2019/6/17.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

class CustomNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //获取系统的pop手势
        guard let gesReg = interactivePopGestureRecognizer else {return}
        //获取收拾添加的view
        guard let gesView = gesReg.view else {return}
        //运行时查看view中的属性
        /*
        var count:UInt32 = 0
     let ivas = class_copyIvarList(UIGestureRecognizer.self, &count)!
        for i in 0..<count{
            let ivar = ivas[Int(i)]
            let name = ivar_getName(ivar)
            print(String(cString: name!))
        }
        */
        
        let targets =  gesReg.value(forKey:"_targets") as? [NSObject]
        guard let targetObjc = targets?.first else{return}
        print(targetObjc)
        //取出target和action
        guard let target = targetObjc.value(forKey: "target") else{return}
        let action = Selector(("handleNavigationTransition:"))
        
        //自己创建pan手势并添加
        let panGes = UIPanGestureRecognizer()
        gesView.addGestureRecognizer(panGes)
        panGes.addTarget(target, action: action)
        
        
        
        
        
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }
}
