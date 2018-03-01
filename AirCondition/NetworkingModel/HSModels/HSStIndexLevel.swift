//
//  HSStIndexLevel.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import ObjectMapper

class HSStIndexLevel: Mappable {
    
    var id: Int? = 0
    var indexLevelName: String? = ""
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        indexLevelName <- map["indexLevelName"]
    }
}
