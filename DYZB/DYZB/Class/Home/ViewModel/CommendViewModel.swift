//
//  CommendViewModel.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/28.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit
import SwiftyJSON
class CommendViewModel{
//    //懒加载属性
    private var anchorGroups:[AnchoGroup] = [AnchoGroup]()
}

extension CommendViewModel{
    func loadData() {
        
        //获取第一组数据
        //获取第二组颜值数据
        //获取第三组后面的数据
        //http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=NSDate.getCurrentTime()
         let paraments = ["limit" : "4", "offset" : "0", "time" :NSDate.getCurrentTime()]
        NetWorkingTool .requestNet(type: .GET, URL: "http://capi.douyucdn.cn/api/v1/getHotCate", Paraments:paraments) { (result) in
            
            //1.将result转成字典类型
            guard let resultDict = result as? [String:AnyObject] else{return}
            //2.根据data的改key获取数组
            guard let dictArr = resultDict["data"] as? [[String : AnyObject]] else {return}
            //3.便利数组获取字典并且在字典转成模型对象
            for dict in dictArr{
                let anchor = AnchoGroup(dict: dict)
                print(anchor.tag_name)
            }
            for group in self.anchorGroups{
                print(group.tag_name)
            }
        }
        
    }
}
