//
//  CollectionCycleViewCell.swift
//  DYZB
//
//  Created by yuhangxi on 2019/5/16.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit
import Kingfisher
class CollectionCycleViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImageVIew: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    
    var cyclemodel :cycleModel?{
        didSet{
            titleLable.text = cyclemodel?.title
            let iconURL = NSURL(string: cyclemodel?.pic_url ?? "")
            let resource = ImageResource(downloadURL:iconURL! as URL)
            iconImageVIew.kf.setImage(with:resource)
        }
    }
    

}
