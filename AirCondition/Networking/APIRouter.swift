//
//  APIRouter.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 13.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getStations()
    case getStationSensorsData(stationId: String)
    case getSensorsData(sensorId: String)
    case getIndex(stationId: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getStations, .getStationSensorsData, .getSensorsData, .getIndex:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getStations:
            return "/station/findAll"
            
        case .getStationSensorsData(let stationId):
            return "/station/sensors/\(stationId)"
            
        case .getSensorsData(let sensorId):
            return "/data/getData/\(sensorId)"
            
        case .getIndex(let stationId):
            return "/aqindex/getIndex/\(stationId)"
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try K.Server.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        return urlRequest
    }
}
