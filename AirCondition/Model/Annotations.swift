//
//  Annotations.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 14.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class Annotations: NSObject, MKAnnotation {
    
    let title: String?
    let locationName: String?
    let longtitude: String
    let lattitude: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, longtitude: String, lattitude: String) {
        self.title = title
        self.locationName = locationName
        self.longtitude = longtitude
        self.lattitude = lattitude
        
        self.coordinate = CLLocationCoordinate2D(latitude:Double(lattitude)!,
                                                 longitude: Double(longtitude)!)
        
        super.init()
    }

    var subtitle: String? {
        return locationName
    }

    // Annotation right callout accessory opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}
