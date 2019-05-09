//
//  AnchorModel.swift
//  DYZB
//
//  Created by yuhangxi on 2019/5/6.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    //房间的ID
   @objc var room_id:Int = 0
    //房间图片对应的URLString
   @objc var vertical_src:String = ""
    
    //判断是手机直播还是电脑直播 0:电脑直播，1:手机直播
   @objc var isVertical:Int = 0
    //房间名称
   @objc var room_name:String = ""
    //主播昵称
   @objc var nickname:String = ""
    //在线人数
   @objc var online:Int = 0
    //主播所在的城市
   @objc var anchor_city:String = ""
    
    override init() {
        
    }
    
    init(dict:[String:AnyObject]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
