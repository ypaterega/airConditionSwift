//
//  HSStation.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import ObjectMapper

class HSStation: Mappable {
    
    var id: Int? = 0
    var stationName: String? = ""
    var gegrLat: String? = ""
    var gegrLon: String? = ""
    var city: HSCity? = nil
    var addressStreet: String? = ""
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id  <- map["conditions"]
        stationName <- map["stationName"]
        gegrLat <- map["gegrLat"]
        gegrLon <- map["gegrLon"]
        city <- map["city"]
        addressStreet <- map["addressStreet"]
    }
}
