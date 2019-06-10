//
//  AmuseViewModel.swift
//  DYZB
//
//  Created by yuhangxi on 2019/5/31.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

class AmuseViewModel:BaseViewmodel{
    
    func loadAmuseData(finishBack:@escaping ()->()){
        //http://capi.douyucdn.cn/api/v1/getHotRoom/2
    loadAnchordata(urlstring: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", paramenter: nil, finishBack: finishBack)
        
    }
    
}
