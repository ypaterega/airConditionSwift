//
//  StationListViewModel.swift
//  AirCondition
//
//  Created by Iurii Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation

class StationListViewModel: StationListModelProtocol {
    
    let showLoading: Observer = Observer(false)
    
    weak var coordinatorDelegate: StationListViewModelCoordinatorDelegate?
    
    let stationListCells = Observer([StationListCellViewModel]())
    var stations: [HSStation]?
    let httpService: HttpService
    
    init(httpService: HttpService = HttpService()) {
        self.httpService = httpService
    }
    
    func onLoad() {
        httpService.getStations(completion: { [weak self] result in
            self?.setCellsData(from: result)
            self?.stations = result
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
    
    func openStation(_ index: Int) {
        if let stations = stations, let coordinatorDelegate = coordinatorDelegate  , index < stations.count {
            if let stationId = stations[index].id {
                coordinatorDelegate.stationListViewModelDidSelectData(self, data: stationId)
            }
        }
    }
}
