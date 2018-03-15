//
//  SensorData.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 15.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation

class SensorData {
    
    var key: String
    var values: [SensorDataValue]
    
    init(key: String, values: [SensorDataValue]) {
        self.key = key
        self.values = values
    }
}

