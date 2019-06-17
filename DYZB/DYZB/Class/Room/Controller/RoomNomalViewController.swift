//
//  RoomNomalViewController.swift
//  DYZB
//
//  Created by yuhangxi on 2019/6/17.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

class RoomNomalViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
    view.backgroundColor = UIColor.red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
//    navigationController?.interactivePopGestureRecognizer?.delegate = self
//    navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
