//
//  HttpService.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 01.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

enum ServiceError: Error {
    case cannotParse
}

class HttpService {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    typealias GetStationsCompletion = (_ result: [HSStation]) -> Void
    typealias GetStationDetailsCompletion = (_ result: [HSStationDetails]) -> Void
    typealias GetStationSensorsDetailsCompletion = (_ result: HSSensorsData) -> Void
    typealias GetAirConditionCompletion = (_ result: HSAirConditionIndex) -> Void
    
    func getStations(completion: @escaping GetStationsCompletion) {
        
        Alamofire.request(APIRouter.getStations()).responseArray { (response : DataResponse <[HSStation]>) in
            if let jsonArray = response.value {
                completion(jsonArray)
            }
        }
    }
    
    func getStationSensorsData(stationId: String, completion: @escaping GetStationDetailsCompletion) {
        
       Alamofire.request(APIRouter.getStationSensorsData(stationId: stationId)).responseArray { (response : DataResponse <[HSStationDetails]>) in
            if let jsonArray = response.value {
                completion(jsonArray)
            }
        }
    }
    
    func getSensorsData(sensorId: String , completion: @escaping GetStationSensorsDetailsCompletion) {
    
        Alamofire.request(APIRouter.getSensorsData(sensorId: sensorId)).responseObject { (response : DataResponse <HSSensorsData>) in
            if let jsonArray = response.value {
                completion(jsonArray)
            }
        }
    }
    
    func getIndex(stationId: String , completion: @escaping GetAirConditionCompletion) {
        
        Alamofire.request(APIRouter.getIndex(stationId: stationId)).responseObject { (response : DataResponse <HSAirConditionIndex>) in
            if let jsonArray = response.value {
                completion(jsonArray)
            }
        }
    }
}
