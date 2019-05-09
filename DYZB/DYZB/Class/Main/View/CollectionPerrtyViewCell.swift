//
//  CollectionPerrtyViewCell.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/25.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit
import Kingfisher
class CollectionPerrtyViewCell: UICollectionViewCell {

 
   //定义属性
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var placelabel: UIButton!
    
    //定义模型属性
    var model:AnchorModel?{
        didSet{
            var onlineStr:String = ""
            guard let model = model else {return}
            if model.online > 10000{
                onlineStr = "\(Int(model.online / 10000))在线"
            }else{
                onlineStr = "\(model.online)在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            name.text = model.nickname
            placelabel.setTitle(model.anchor_city, for: .normal)
            
            let iconURL = NSURL(string: model.vertical_src)
            let resource = ImageResource(downloadURL:iconURL! as URL)
            iconImageView.kf.setImage(with:resource)
            
        }
    }
    
    
    

}
