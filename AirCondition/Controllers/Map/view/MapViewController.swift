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
        mapView.delegate = self
        
        setupNavBar()
        
        bindViewModel() 
        viewModel.onLoad()
    }
    
    private func setupNavBar(){
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: 60))
        let navItem = UINavigationItem(title: "Stations map")
        let item = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.bookmarks,
                                       target: nil,
                                       action: #selector(openStationList))
        navItem.rightBarButtonItem = item
        navBar.setItems([navItem], animated: false)
                
        self.view.addSubview(navBar)
    }
    
    @objc func openStationList() {
        viewModel.openStationList()
    }
    
    private func bindViewModel() {
        viewModel.annotationsList.bindAndFire() { [weak self] _ in
            self?.mapView.addAnnotations((self?.viewModel.annotationsList.value)!)
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        guard let annotation = annotation as? Annotations else { return nil }

        let identifier = "marker"
        var view: MKMarkerAnnotationView

        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {

            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Annotations
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
}
