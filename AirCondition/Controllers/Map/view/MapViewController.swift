//
//  MapViewController.swift
//  AirCondition
//
//  Created by Yuriy Paterega on 13.03.18.
//  Copyright © 2018 Yuriy Paterega. All rights reserved.
//

//UNFINISHED

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let viewModel: MapViewModel = MapViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel() 
        viewModel.onLoad()
    }
    
    private func bindViewModel() {
        viewModel.annotationsList.bindAndFire() { [weak self] _ in
            self?.mapView.addAnnotations((self?.viewModel.annotationsList.value)!)
        }
    }
}
