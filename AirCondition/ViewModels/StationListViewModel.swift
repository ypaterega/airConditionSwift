//
//  StationListViewModel.swift
//  AirCondition
//
//  Created by Iurii Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation

class StationListViewModel {
    
    var allStationData: [HSStation] = [HSStation]()
    var stationModelData: Station?
    
    let showLoading: Observer = Observer(false)
    
    let stationListCells = Observer([StationListCellViewModel]())
    let httpService: HttpService
    
    init(httpService: HttpService = HttpService()) {
        self.httpService = httpService
    }
    
    func onLoad() {
        httpService.getStations(completion: { [weak self] result in
            do {
                self?.allStationData = result
                self?.setCellsData()
            } catch {
            }
        })
    }
    
    private func setCellsData() {
        for stationData in allStationData {
            stationModelData?.city = stationData.city?.commune?.communeName
            stationModelData?.addressStreet = stationData.addressStreet
            stationModelData?.gegrLon = stationData.gegrLon
            stationModelData?.gegrLat = stationData.gegrLat
        }
    }
}


