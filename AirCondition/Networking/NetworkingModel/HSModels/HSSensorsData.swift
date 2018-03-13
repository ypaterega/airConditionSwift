//
//  HSSensorsData.swift
//  AirCondition
//
//  Created by Iurii Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import ObjectMapper

class HSSensorsData: Mappable {
    
    var key: String? = ""
    var values: [HSSensorsDataValue]? = []
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        key <- map["key"]
        values <- map["values"]
    }
}
