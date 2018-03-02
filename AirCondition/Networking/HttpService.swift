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
    
    fileprivate let mainAdressUrl: String = "http://api.gios.gov.pl/pjp-api/rest/"
    fileprivate let allStationUrl: String = "station/findAll"
    fileprivate let sensorsStationUrl: String = "station/sensors/"
    fileprivate let measuringSensorsUrl: String = "data/getData/"
    fileprivate let airConditionStationUrl: String = "aqindex/getIndex/"
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    typealias GetStationsCompletion = (_ result: [HSStation]) -> Void
    typealias GetStationDetailsCompletion = (_ result: [HSStationDetails]) -> Void
    typealias GetAirConditionCompletion = (_ result: HSAirConditionIndex) -> Void
    
    func getStations(completion: @escaping GetStationsCompletion) {
        
        let allStationsUrl = mainAdressUrl + allStationUrl
    
        Alamofire.request(allStationsUrl, method: .get).responseArray { (response : DataResponse <[HSStation]>) in
            if let jsonArray = response.value {
                completion(jsonArray)
            }
        }
    }
    
    func getSensorsData(stationId: String , completion: @escaping GetStationDetailsCompletion) {
        
        let stationDetailsUrl = mainAdressUrl + sensorsStationUrl + stationId
        
        Alamofire.request(stationDetailsUrl, method: .get).responseArray { (response : DataResponse <[HSStationDetails]>) in
            if let jsonArray = response.value {
                completion(jsonArray)
            }
        }
    }
    
    func getSensorsData(stationId: String , completion: @escaping GetAirConditionCompletion) {
        
        let airConditionUrl = mainAdressUrl + airConditionStationUrl + stationId
        
        Alamofire.request(airConditionUrl, method: .get).responseObject { (response : DataResponse <HSAirConditionIndex>) in
            if let jsonArray = response.value {
                completion(jsonArray)
            }
        }
    }
}
