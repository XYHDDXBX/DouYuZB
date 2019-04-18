//
//  MainViewController.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/17.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChaildVC(name:"Home")
        addChaildVC(name: "Live")
        addChaildVC(name: "Follow")
        addChaildVC(name: "Profile")
    }
 //添加子控制器
    private func addChaildVC(name:String){
        //通过storyboard获取控制器
        let childVC = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()!
        //添加子控制器
        addChildViewController(childVC)
        
    }

}
