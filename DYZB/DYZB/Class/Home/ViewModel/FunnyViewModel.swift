//
//  FunnyViewModel.swift
//  DYZB
//
//  Created by yuhangxi on 2019/6/13.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

class FunnyViewModel: BaseViewmodel {

    func loadFunnydata(finishBack:@escaping ()->()){
        let paraments = ["limit" : "4", "offset" : "0", "time" :NSDate.getCurrentTime()]
        loadAnchordata(urlstring:"http://capi.douyucdn.cn/api/v1/getHotCate", paramenter: paraments as [String : AnyObject], finishBack: finishBack)
    }
}
