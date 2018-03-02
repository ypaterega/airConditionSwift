//
//  HSAirConditionIndex.swift
//  AirCondition
//
//  Created by Iurii Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import ObjectMapper

class HSAirConditionIndex: Mappable {
    
    var id: Int? = 0
    var stCalcDate: String? = ""
    var stIndexLevel: HSStIndexLevel? = nil
    var stSourceDataDate: String? = ""
    var so2CalcDate: String? = ""
    var so2IndexLevel: String? = ""
    var so2SourceDataDate: String? = ""
    var no2CalcDate: String? = ""
    var no2IndexLevel: String? = ""
    var no2SourceDataDate: String? = ""
    var coCalcDate: String? = ""
    var coIndexLevel: String? = ""
    var coSourceDataDate: String? = ""
    var pm10CalcDate: String? = ""
    var pm10IndexLevel: String? = ""
    var pm10SourceDataDate: String? = ""
    var pm25CalcDate: String? = ""
    var pm25IndexLevel: String? = ""
    var pm25SourceDataDate: String? = ""
    var o3CalcDate: String? = ""
    var o3IndexLevel: String? = ""
    var o3SourceDataDate: String? = ""
    var c6h6CalcDate: String? = ""
    var c6h6IndexLevel: String? = ""
    var c6h6SourceDataDate: String? = ""
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {        
        id <- map["id"]
        stCalcDate <- map["stCalcDate"]
        stIndexLevel <- map["stIndexLevel"]
        stSourceDataDate <- map["stSourceDataDate"]
        so2CalcDate <- map["so2CalcDate"]
        so2IndexLevel <- map["so2IndexLevel"]
        so2SourceDataDate <- map["so2SourceDataDate"]
        no2CalcDate <- map["no2CalcDate"]
        no2IndexLevel <- map["no2IndexLevel"]
        no2SourceDataDate <- map["no2SourceDataDate"]
        coCalcDate <- map["coCalcDate"]
        coIndexLevel <- map["coIndexLevel"]
        coSourceDataDate <- map["coSourceDataDate"]
        pm10CalcDate <- map["pm10CalcDate"]
        pm10IndexLevel <- map["pm10IndexLevel"]
        pm10SourceDataDate <- map["pm10SourceDataDate"]
        pm25CalcDate <- map["pm25CalcDate"]
        pm25IndexLevel <- map["pm25IndexLevel"]
        pm25SourceDataDate <- map["pm25SourceDataDate"]
        o3CalcDate <- map["o3CalcDate"]
        o3IndexLevel <- map["o3IndexLevel"]
        o3SourceDataDate <- map["o3SourceDataDate"]
        c6h6CalcDate <- map["c6h6CalcDate"]
        c6h6IndexLevel <- map["c6h6IndexLevel"]
        c6h6SourceDataDate <- map["c6h6SourceDataDate"]
    }
}

