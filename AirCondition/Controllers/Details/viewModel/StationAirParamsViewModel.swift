//
//  StationAirParamsViewModel.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 02.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation

class StationAirParamsViewModel: StationAirParamsViewModelProtocol {
    
    let showLoading: Observer = Observer(false)
    
    weak var coordinatorDelegate: StationAirParamsViewModelCoordinatorDelegate?
    var stationAirParams: String?
    
    let stationAirParamsListCells = Observer([StationAirParamsCell]())
    let httpService: HttpService
    
    init(httpService: HttpService = HttpService()) {
        self.httpService = httpService
    }
    
    func onLoad(stationId: Int) {
        httpService.getStationSensorsData(stationId: String(stationId), completion: { [weak self] result in
    
        })
    }
}
