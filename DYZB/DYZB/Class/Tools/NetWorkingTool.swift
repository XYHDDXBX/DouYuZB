//
//  NetWorkingTool.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/25.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit
import Alamofire

enum MethdType {
    case GET
    case POST
}

class NetWorkingTool{
    class func requestNet(type:MethdType,URL:String,Paraments:[String:Any]? = nil, finishCallback: @escaping (_ result:Any) -> ()) {
        let medth = type == .GET ? HTTPMethod.get :HTTPMethod.post
        
        Alamofire.request(URL, method: medth, parameters: Paraments).responseJSON { (response) in
            guard  let result = response.result.value else{
                print(response.result.error!)
                return
            }
            finishCallback(result)
        }
    }
}
