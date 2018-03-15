//
//  SensorDataValue.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 15.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation

class SensorDataValue {
    
    var date: String
    var value: Int
    
    init(date: String, value: Int) {
        self.date = date
        self.value = value
    }
}

