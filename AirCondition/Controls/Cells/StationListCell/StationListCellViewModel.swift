//
//  StationListCellViewModel.swift
//  AirCondition
//
//  Created by Iurii Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

// TO REFACTOR

import Foundation

protocol StationListCellViewModel {
    
    var stationItem: Station { get }
}

extension Station: StationListCellViewModel {
    
    var stationItem: Station {
        return self
    }
}
