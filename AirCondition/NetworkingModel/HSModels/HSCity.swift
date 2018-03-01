//
//  HSCity.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import ObjectMapper

class HSCity: Mappable {
    
    var id: Int? = 0
    var name: String? = ""
    var commune: HSCommune? = nil
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        commune <- map["commune"]
    }
}
