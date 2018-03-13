//
//  HSSensorsDataValue.swift
//  AirCondition
//
//  Created by Iurii Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import ObjectMapper

class HSSensorsDataValue: Mappable {
    
    var date: String? = ""
    var value: Int? = 0
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        date <- map["date"]
        value <- map["value"]
    }
}
