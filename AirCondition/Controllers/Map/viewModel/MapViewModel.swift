//
//  MapViewModel.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 13.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import MapKit

class MapViewModel: NSObject, MKMapViewDelegate {
    
    weak var coordinatorDelegate: MapViewModelCoordinatorDelegate?
    let annotationsList = Observer([Annotations]())
    let httpService: HttpService
    
    init(httpService: HttpService = HttpService()) {
        self.httpService = httpService
    }
    
    func onLoad() {
        httpService.getStations(completion: { [weak self] result in
            self?.setPointsData(from: result)
        })
    }
    
    private func setPointsData(from apiModel: [HSStation]) {
        annotationsList.value = apiModel.map { model in
            //TODO
            Annotations(title: model.stationName!,
                        locationName: (model.city?.name)!,
                        longtitude: model.gegrLon!,
                        lattitude: model.gegrLat!)
        }
    }
}
