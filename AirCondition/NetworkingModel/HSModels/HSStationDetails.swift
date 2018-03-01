//
//  HSStationDetails.swift
//  AirCondition
//
//  Created by Iurii Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import ObjectMapper

class HSStationDetails: Mappable {
    
    var id: Int? = 0
    var stationId: Int? = 0
    var param: HSStationParameters? = nil
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id  <- map["id"]
        stationId <- map["stationId"]
        param <- map["param"]
    }
}
