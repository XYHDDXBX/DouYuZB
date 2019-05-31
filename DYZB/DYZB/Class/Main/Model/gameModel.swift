//
//  gameModel.swift
//  DYZB
//
//  Created by yuhangxi on 2019/5/29.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

class gameModel:NSObject{

   @objc var tag_name:String = ""
   @objc var pic_name:String = ""
    
    
    
    init(dict:[String:Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
    
}
