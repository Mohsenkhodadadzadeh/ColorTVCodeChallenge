//
//  MapViewController.swift
//  ColorTVCodeChallenge
//
//  Created by Mohsen khodadadazadeh on 7/18/20.
//  Copyright © 2020 Mohsen khodadadazadeh. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var locManager: CLLocationManager!
    
    var locationForCheck: CLLocationCoordinate2D?
    override func viewDidLoad() {
        super.viewDidLoad()

        let initLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        mapView.centerToLocation(initLocation)
        
        Network().reachability { [weak self] (state) in
            if !state {
                self?.locationForCheck = nil
                self?.performSegue(withIdentifier: "showDetailSegue", sender: self)
                
            }
        }
        
        if CLLocationManager.locationServicesEnabled() {
            locManager = CLLocationManager()
            if CLLocationManager.authorizationStatus() != .authorizedWhenInUse     {
                locManager.requestWhenInUseAuthorization()
            }
            //locManager.requestAlwaysAuthorization()
           // locManager.requestWhenInUseAuthorization()
            locManager.delegate = self
            locManager.distanceFilter = kCLDistanceFilterNone
            locManager.desiredAccuracy = kCLLocationAccuracyBest
            locManager.startUpdatingLocation()
        }
        
        
        let mapTap = UITapGestureRecognizer(target: self, action: #selector(doubleTap(_:)))
        mapTap.numberOfTapsRequired = 2
        mapTap.numberOfTouchesRequired = 1
        mapTap.delegate = self
        mapView.addGestureRecognizer(mapTap)
    }
    
    
    @objc func doubleTap(_ tap: UITapGestureRecognizer)  {
        if tap.state == .recognized {
               // Get map coordinate from touch point
               let touchPt: CGPoint = tap.location(in: mapView)
               let coord: CLLocationCoordinate2D = mapView.convert(touchPt, toCoordinateFrom: mapView)
            locationForCheck = coord
            performSegue(withIdentifier: "showDetailSegue", sender: self)
            // let art = Art(loc: coord, title: "pontClicked", locationName: "TestLoc", disipline: "not")
            //mapView.addAnnotation(art)
            
           }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is MapDetailViewController {
            let vc = segue.destination as? MapDetailViewController
            vc?.location = locationForCheck
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
