//
//  UIColor-Extension.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/18.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
    }
    
    class func randowColor()->UIColor{
        return UIColor(red: CGFloat(arc4random_uniform(UInt32(256.0))), green: CGFloat(arc4random_uniform(UInt32(256.0))), blue: CGFloat(arc4random_uniform(UInt32(256.0))))
    }
 }
