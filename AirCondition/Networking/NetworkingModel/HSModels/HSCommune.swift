//
//  HSCommune.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import ObjectMapper

class HSCommune: Mappable {
    
    var communeName: String? = ""
    var districtName: String? = ""
    var provinceName: String? = ""
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        communeName <- map["communeName"]
        districtName <- map["districtName"]
        provinceName <- map["provinceName"]
    }
}
