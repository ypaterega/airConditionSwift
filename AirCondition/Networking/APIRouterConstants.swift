//
//  APIRouterConstants.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 13.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation

struct K {
    struct Server {
        static let baseURL: String = "http://api.gios.gov.pl/pjp-api/rest"
    }
}

// MARK: - HTTPHeaderFields
enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
