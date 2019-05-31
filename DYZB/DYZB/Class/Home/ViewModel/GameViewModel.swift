//
//  GameViewModel.swift
//  DYZB
//
//  Created by yuhangxi on 2019/5/29.
//  Copyright © 2019 yuhangxi. All rights reserved.
//

import UIKit




class GameViewModel{

  lazy var games:[gameModel] = [gameModel]()
    
    func loadAllGameData(finishback:@escaping() -> ()){
        NetWorkingTool.requestNet(type: .GET, URL: "http://capi.douyucdn.cn/api/v1/getColumnDetail", Paraments: ["shortname" : "game"]) { (result) in
    //http://capi.douyucdn.cn/api/v1/getColumnDetail?shortname=game
            guard let result = result as? [String:Any] else{return}
            guard let dictArr = result["data"] as? [[String:Any]] else{return}
            for dict in dictArr{
            self.games.append(gameModel(dict: dict))
            }
            finishback()
        }
        
    }
    
}
