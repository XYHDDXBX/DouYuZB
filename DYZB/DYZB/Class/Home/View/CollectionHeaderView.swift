//
//  CollectionHeaderView.swift
//  DYZB
//
//  Created by yuhangxi on 2019/4/23.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
//headView的属性
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var moreBtn: UIButton!
    var group:AnchoGroup?{
        didSet{
           titleLabel.text = group?.tag_name
            iconImageView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
        }
    }
    
  class  func creatHeadView() -> CollectionHeaderView {
        return Bundle.main.loadNibNamed("CollectionHeaderView", owner: nil, options: nil)?.first as! CollectionHeaderView
    }
}
