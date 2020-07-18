//
//  MapKitDelegation.swift
//  ColorTVCodeChallenge
//
//  Created by Mohsen khodadadazadeh on 7/18/20.
//  Copyright © 2020 Mohsen khodadadazadeh. All rights reserved.
//

import MapKit
import UIKit
import CoreLocation

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        mapView.centerToLocation(CLLocation(latitude: locValue.latitude, longitude: locValue.longitude),regionRedius: 10000)
        locManager.stopUpdatingLocation()
    }
}
