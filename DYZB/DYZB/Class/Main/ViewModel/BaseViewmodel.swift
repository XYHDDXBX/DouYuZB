//
//  BaseViewmodel.swift
//  DYZB
//
//  Created by yuhangxi on 2019/6/4.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

class BaseViewmodel{
 lazy var amuseGroups:[AnchoGroup] = [AnchoGroup]()
}

extension BaseViewmodel{
    func loadAnchordata(urlstring:String,paramenter:[String:AnyObject]? = nil,finishBack:@escaping ()->()){
        NetWorkingTool.requestNet(type: .GET, URL: urlstring,Paraments: paramenter) { (result) in
            guard  let result = result as? [String:AnyObject] else{return}
            guard let amuseArr = result["data"] as? [[String:AnyObject]] else{return}
            for dict in amuseArr{
                self.amuseGroups.append(AnchoGroup(dict: dict))
            }
            finishBack()
        }
    }
}
