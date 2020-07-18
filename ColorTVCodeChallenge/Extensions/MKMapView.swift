//
//  MKMapView.swift
//  ColorTVCodeChallenge
//
//  Created by Mohsen khodadadazadeh on 7/18/20.
//  Copyright © 2020 Mohsen khodadadazadeh. All rights reserved.
//

import MapKit
extension MKMapView {
    func centerToLocation(_ loc: CLLocation, regionRedius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(center: loc.coordinate, latitudinalMeters: regionRedius, longitudinalMeters: regionRedius)
        setRegion(coordinateRegion, animated: true)
    }
}
