//
//  siteInfo.swift
//  finalHomework
//
//  Created by User08 on 2020/6/24.
//  Copyright © 2020 00657040. All rights reserved.
//

import Foundation

struct siteInfo: Codable{
    var StationUID:String
    var StationName:NameType
    var BikesCapacity:Int
    var StationAddress:NameType
}
struct NameType: Codable {
    var Zh_tw:String
    var En:String
}
