//
//  StationListViewModel.swift
//  AirCondition
//
//  Created by Iurii Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation

class StationListViewModel {
    
    let showLoading: Observer = Observer(false)
    
    weak var coordinatorDelegate: StationListCoordinatorDelegate?
    
    let stationListCells = Observer([StationListCellViewModel]())
    let httpService: HttpService
    
    init(httpService: HttpService = HttpService()) {
        self.httpService = httpService
    }
    
    func onLoad() {
        httpService.getStations(completion: { [weak self] result in
            self?.setCellsData(from: result)
        })
    }
    
    private func setCellsData(from apiModel: [HSStation]) {
        stationListCells.value = apiModel.map { model in
            Station(id: model.id,
                    stationName: model.stationName,
                    gegrLat: model.gegrLat,
                    gegrLon: model.gegrLon,
                    city: model.city?.name,
                    addressStreet: model.addressStreet)
        }
    }
}
