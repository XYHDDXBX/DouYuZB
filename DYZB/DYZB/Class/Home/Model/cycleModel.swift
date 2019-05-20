//
//  cycleModel.swift
//  DYZB
//
//  Created by yuhangxi on 2019/5/16.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

class cycleModel: NSObject {

    //标题
   @objc var title:String = ""
    //展示图片地址
   @objc var pic_url:String = ""
    //主播信息对应的字典
   @objc var room:[String :AnyObject]?{
        didSet{
            guard let room = room else{return}
            anchor = AnchorModel(dict: room)
        }
    }
    //主播信息对应的模型对象
    var anchor:AnchorModel?
    
    init(dict:[String : AnyObject]){
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
