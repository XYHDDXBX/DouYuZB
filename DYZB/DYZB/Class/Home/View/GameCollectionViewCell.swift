//
//  GameCollectionViewCell.swift
//  DYZB
//
//  Created by yuhangxi on 2019/5/16.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit
import Kingfisher
class GameCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    
    
    var gameModel:AnchoGroup?
    {
        didSet{
            titleLable.text = gameModel?.tag_name
            
            let icon = (gameModel?.icon_url)! as NSString
            
            if icon.isEqual(to: "home_more_btn"){
                iconImageView.image = UIImage(named: icon as String)
            }else{
                let iconUrl = NSURL(string: gameModel?.icon_url ?? "")
                let resource = ImageResource(downloadURL: iconUrl! as URL)
                iconImageView.kf.setImage(with: resource)
            }
            
            
        }
    }
    
    
    var topModel:gameModel?{
        didSet{
            
            titleLable.text = topModel?.tag_name
            let iconUrl = NSURL(string: topModel?.pic_name ?? "")
            let resource = ImageResource(downloadURL: iconUrl! as URL)
            iconImageView.kf.setImage(with: resource)
            
        }
    }
    
    
    
}
