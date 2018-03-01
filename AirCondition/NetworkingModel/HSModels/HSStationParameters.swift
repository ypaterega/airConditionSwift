//
//  HSStationParameters.swift
//  AirCondition
//
//  Created by Iurii Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import ObjectMapper

class HSStationParameters: Mappable {
    
    var paramName: String? = ""
    var paramFormula: String? = ""
    var paramCode: String? = ""
    var idParam: Int? = 0
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        paramName  <- map["paramName"]
        paramFormula <- map["paramFormula"]
        paramCode <- map["paramCode"]
        idParam <- map["idParam"]
    }
}
