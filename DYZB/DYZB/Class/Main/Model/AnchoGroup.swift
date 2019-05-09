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
    @objc var room_list:[[String : AnyObject]]?{
        didSet{
            guard let room_list = room_list else { return }
            for dict in room_list{
                anchors.append(AnchorModel(dict: dict))
            }
        }
    }
    //组显示的标题tag_name
   @objc var tag_name : String = ""
    //组显示的图标small_icon_url
   @objc var icon_name:String = "home_header_normal"
    //定义主播的模型对象数组
   @objc lazy var anchors:[AnchorModel] = [AnchorModel]()
    override init() {
        
    }
    
    init(dict:[String:AnyObject]){
        super.init()
        setValuesForKeys(dict)
        
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {

    }
    /*
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "room_list" {
            if let dataArr = value as? [[String:AnyObject]]{
                for dict in dataArr{
                    anchors.append(AnchorModel(dict: dict))
                }
            }
        }
    }
    */
}






