//
//  CommendViewModel.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/28.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit
class CommendViewModel{
//    //懒加载属性
    lazy var anchorGroups:[AnchoGroup] = [AnchoGroup]()
    private lazy var hotDataGroup:AnchoGroup = AnchoGroup()
    private lazy var beautyDataGroup:AnchoGroup = AnchoGroup()
}

extension CommendViewModel{
    func loadData(finishCallback:@escaping ()->()) {
        
        let paraments = ["limit" : "4", "offset" : "0", "time" :NSDate.getCurrentTime()]
        let dispatchGroup = DispatchGroup()
        
        //获取第一组数据
        //进入组
        dispatchGroup.enter()
        NetWorkingTool.requestNet(type: .GET, URL: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", Paraments: ["time":NSDate.getCurrentTime()]) { (result) in
            //1.将result转成字典类型
            guard let resultDict = result as? [String:AnyObject] else{return}
            //2.根据data的改key获取数组
            guard let dictArr = resultDict["data"] as? [[String : AnyObject]] else {return}
            //3.定义一个group将字典转模型
            self.hotDataGroup.tag_name = "热门"
            self.hotDataGroup.icon_name = "home_header_hot"
            for dict in dictArr{
                let anchors = AnchorModel(dict: dict)
                self.hotDataGroup.anchors.append(anchors)
                print(anchors.anchor_city)
            }
            //离开组
            dispatchGroup.leave()
//            print("请求到热门数据")
        }
        
        //获取第二组颜值数据
        //http://capi.douyucdn.cn/api/v1/getVerticalRoom?limit=4&offset=0&time=NSDate.getCurrentTime()
        dispatchGroup.enter()
        NetWorkingTool.requestNet(type: .GET, URL: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", Paraments: paraments) { (result) in
            //1.将result转成字典类型
            guard let resultDict = result as? [String:AnyObject] else{return}
            //2.根据data的改key获取数组
            guard let dictArr = resultDict["data"] as? [[String : AnyObject]] else {return}
            //3.定义一个group将字典转模型
            self.beautyDataGroup.tag_name = "颜值"
            self.beautyDataGroup.icon_name = "home_header_phone"
            for dict in dictArr{
                let anchors = AnchorModel(dict: dict)
                self.beautyDataGroup.anchors.append(anchors)
//                print(anchors.anchor_city)
            }
            //离开组
            dispatchGroup.leave()
//            print("请求到颜值数据")
        }
        
        //获取第三组后面的数据
        //http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=NSDate.getCurrentTime()
        dispatchGroup.enter()
        NetWorkingTool .requestNet(type: .GET, URL: "http://capi.douyucdn.cn/api/v1/getHotCate", Paraments:paraments) { (result) in
            
            //1.将result转成字典类型
            guard let resultDict = result as? [String:AnyObject] else{return}
            //2.根据data的改key获取数组
            guard let dictArr = resultDict["data"] as? [[String : AnyObject]] else {return}
            //3.便利数组获取字典并且在字典转成模型对象
            for dict in dictArr{
                let anchor = AnchoGroup(dict: dict)
                self.anchorGroups.append(anchor)
            }
            //离开组
            dispatchGroup.leave()
//            print("请求到2-12组数据")
        }
        dispatchGroup.notify(qos: .userInteractive, flags: .barrier, queue: DispatchQueue.main) {
//            print("请求到所有的数据")
            self.anchorGroups.insert(self.beautyDataGroup, at: 0)
            self.anchorGroups.insert(self.hotDataGroup, at: 0)
            finishCallback()
        }
    }
}
