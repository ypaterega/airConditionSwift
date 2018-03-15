//
//  StationAirParamsViewModel.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 02.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

// TODO Add activity indicator in promise

import Foundation
import PromiseKit

class StationAirParamsViewModel: StationAirParamsViewModelProtocol {
    
    let showLoading: Observer = Observer(false)
    
    weak var coordinatorDelegate: StationAirParamsViewModelCoordinatorDelegate?
    var stationAirParams: String?
    
    var sensorData = Observer(SensorData(key: "", values: []))
    
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
                self?.prepareDataChart(result)
                data.fulfill(result)
            })
        }
    }
    
   private func prepareDataChart(_ data: HSSensorsData) {
    
    //TO REFACTOR
    
    var values = [SensorDataValue]()

    data.values = data.values?.filter { $0.value != nil }
    
    for dataValue in data.values! {
            values.append(SensorDataValue(date: dataValue.date!, value: dataValue.value!))
    }
    
    sensorData.value = SensorData(key: data.key!,
                                  values: values)
    }
    
    func closeDetails() {
        coordinatorDelegate?.stationAirParamsViewModelDidEnd(self)
    }
}

