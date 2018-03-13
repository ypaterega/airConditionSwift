//
//  StationAirParamsViewModel.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 02.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation

class StationAirParamsViewModel {
    
    let showLoading: Observer = Observer(false)
    
    let stationAirParamsListCells = Observer([StationAirParamsCell]())
    let httpService: HttpService
    
    init(httpService: HttpService = HttpService()) {
        self.httpService = httpService
    }
    
    func onLoad() {
     
    }
    
    private func setCellsData(from apiModel: HSAirConditionIndex) {

    }
}
