//
//  AnchoGroup.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/28.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

class AnchoGroup:NSObject{
    //该组中对应的房间信息room_list
   @objc var room_list:[[String : AnyObject]]?
    //组显示的标题tag_name
   @objc var tag_name : String = ""
    //组显示的图标small_icon_url
   @objc var small_icon_url:String = "home_header_normal"
    
    init(dict:[String:AnyObject]){
        super.init()
        setValuesForKeys(dict)
        
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {

    }
    
}






