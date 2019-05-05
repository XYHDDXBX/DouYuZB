//
//  Date-Exectation.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/28.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

extension NSDate{
    
   class func getCurrentTime() -> String {
        let date = NSDate()
        let time = Int(date.timeIntervalSince1970)
        return "\(time)"
        
    }
}
