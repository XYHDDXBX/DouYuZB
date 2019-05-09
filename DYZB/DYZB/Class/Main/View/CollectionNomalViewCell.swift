//
//  CollectionNomalViewCell.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/23.
//  Copyright © 2019 yuhangxi. All rights reserved.
//
import UIKit
import Kingfisher
class CollectionNomalViewCell: UICollectionViewCell {
    //图片
    @IBOutlet weak var iconImageView: UIImageView!
    //主播昵称
    
    @IBOutlet weak var nickname: UILabel!
    //在线人数
    
    @IBOutlet weak var onlineNum: UIButton!
    //房间名称

    @IBOutlet weak var roomName: UILabel!
    var model:AnchorModel?{
        didSet{
            var onlineStr:String = ""
            guard let model = model else {return}
            if model.online > 10000{
                onlineStr = "\(Int(model.online / 10000))在线"
            }else{
                onlineStr = "\(model.online)在线"
            }
            onlineNum.setTitle(onlineStr, for: .normal)
            nickname.text = model.nickname
            roomName.text = model.room_name
            let iconURL = NSURL(string: model.vertical_src)
            let resource = ImageResource(downloadURL:iconURL! as URL)
            iconImageView.kf.setImage(with:resource)
            
        }
    }
    

}
