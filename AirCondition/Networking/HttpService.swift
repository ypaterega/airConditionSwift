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
import ObjectMapper

class HttpService {
    
    // MARK: - Generic api calls
    
    typealias Completion<T> = (_ result: T) -> Void
    
    private func arrayRequest<T: Mappable>(route: APIRouter, completion: @escaping Completion<[T]>) {
        Alamofire.request(route).responseArray { (response: DataResponse<[T]>) in
            response.value.map { completion($0) }
        }
    }
    
    private func request<T: Mappable>(route: APIRouter, completion: @escaping Completion<T>) {
        Alamofire.request(route).responseObject { (response: DataResponse<T>) in
            response.value.map { completion($0) }
        }
    }
    
    // MARK: - API Calls
    
    func getStations(completion: @escaping Completion<[HSStation]>) {
        arrayRequest(route: .getStations(), completion: completion)
    }
    
    func getStationSensorsData(stationId: String, completion: @escaping Completion<[HSStationDetails]>) {
        arrayRequest(route: .getStationSensorsData(stationId: stationId), completion: completion)
    }
    
    func getSensorsData(sensorId: String, completion: @escaping Completion<HSSensorsData>) {
        request(route: .getSensorsData(sensorId: sensorId), completion: completion)
    }
    
    func getIndex(stationId: String, completion: @escaping Completion<HSAirConditionIndex>) {
        request(route: .getIndex(stationId: stationId), completion: completion)
    }
}
