//
//  StationParamsCellViewModel.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 02.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation

protocol StationAirParamsCellViewModel {
    
    var stationParamsItem: StationAirParams { get }
    var title: String { get }
    var value: String { get }
}

extension StationAirParams: StationAirParamsCellViewModel {
    
    var stationParamsItem: StationAirParams {
        return self
    }
    
    var title: String {
        return title
    }
    
    var value: String {
        return value
    }
}
