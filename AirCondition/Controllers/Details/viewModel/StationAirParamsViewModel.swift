//
//  StationAirParamsViewModel.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 02.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import PromiseKit

class StationAirParamsViewModel: StationAirParamsViewModelProtocol {
    
    let showLoading: Observer = Observer(false)
    
    weak var coordinatorDelegate: StationAirParamsViewModelCoordinatorDelegate?
    var stationAirParams: String?
    
    let stationAirParamsListCells = Observer([StationAirParamsCell]())
    
    var stationDetails:[HSStationDetails]?
    var sensorParameters:HSSensorsData?
    
    let httpService: HttpService
    
    init(httpService: HttpService = HttpService()) {
        self.httpService = httpService
    }
    
    func onLoad(stationId: Int) {
        
        firstly {
            getStationsSensorData(stationId)
            }.then { sensorId in
                self.getSensorData(sensorId)
        }
    }
    
   private func getStationsSensorData(_ stationId: Int) -> Promise<Int> {
        
        return Promise { data in
            httpService.getStationSensorsData(stationId: String(describing: stationId),
                                              completion: { [weak self] result in
               
                self?.stationDetails = result
                let sensorId = result.first?.id //just first parameter
                data.fulfill(sensorId!)
            })
        }
    }
    
   private func getSensorData(_ sensorId: Int) -> Promise<HSSensorsData> {
        return Promise { data in
            httpService.getSensorsData(sensorId: String(sensorId), completion: { [weak self] result in
                self?.sensorParameters = result
                self?.buildChart(result)
                data.fulfill(result)
            })
        }
    }
    
   private func buildChart(_ data: HSSensorsData) {
        
    }
}

