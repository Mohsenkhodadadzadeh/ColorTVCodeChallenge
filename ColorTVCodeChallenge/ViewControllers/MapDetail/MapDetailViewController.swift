//
//  MapDetailViewController.swift
//  ColorTVCodeChallenge
//
//  Created by Mohsen khodadadazadeh on 7/18/20.
//  Copyright © 2020 Mohsen khodadadazadeh. All rights reserved.
//

import UIKit
import CoreLocation

class MapDetailViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var locationCoordinateLabel: UILabel!
    @IBOutlet weak var temperaturevalueLabel: UILabel!
    @IBOutlet weak var pressureValueLabel: UILabel!
    @IBOutlet weak var humidityValueLabel: UILabel!
    
    @IBOutlet weak var cloudinessValueLabel: UILabel!
    
    @IBOutlet weak var uvValueLabel: UILabel!
    
    var location: CLLocationCoordinate2D?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let strongLoc = location {
            Network().getData(url: URLGenerator.OnCall.shared.getOnCallData(latitude: strongLoc.latitude, longitude: strongLoc.longitude, exclude: .hourly, .daily), method: .get, parameters: nil, headers: nil, success: { [weak self] (value: OnCallWeatherModel) in
                guard let strongSelf = self else {
                    return
                }
                
                strongSelf.locationCoordinateLabel.text = "\(strongLoc.latitude) , \(strongLoc.longitude)"
                OfflineMode.shared.save(strongSelf.locationCoordinateLabel.text, forKey: .coordinate)
                strongSelf.temperaturevalueLabel.text = "\(value.current.temp)"
                OfflineMode.shared.save(strongSelf.temperaturevalueLabel.text, forKey: .temperature)
                strongSelf.pressureValueLabel.text = "\(value.current.pressure)"
                OfflineMode.shared.save(strongSelf.pressureValueLabel.text, forKey: .pressure)
                strongSelf.humidityValueLabel.text = "\(value.current.humidity)"
                OfflineMode.shared.save(strongSelf.humidityValueLabel.text, forKey: .humidity)
                strongSelf.cloudinessValueLabel.text = "\(value.current.clouds)"
                OfflineMode.shared.save(strongSelf.cloudinessValueLabel.text, forKey: .cloudiness)
                strongSelf.uvValueLabel.text = "\(value.current.uvi)"
                OfflineMode.shared.save(strongSelf.uvValueLabel.text, forKey: .uvIndex)
                let lLoc = CLLocation(latitude: strongLoc.latitude, longitude: strongLoc.longitude)
                lLoc.fetchCityAndCountry { (city, country, err) in
                    guard err == nil else {
                        print("error in finding location : \(err)")
                        return
                    }
                    let cityName = "\(city ?? ""), \(country ?? "")"
                    strongSelf.cityNameLabel.text = cityName
                    
                    OfflineMode.shared.save(cityName, forKey: .cityName)
                }
                
            }) { (err: NetworkErrors) in
                print("an error happend: \(err.errorDescription)")
            }
        } else {
            
            
            if let value = OfflineMode.shared.getString(with: .coordinate) {
                locationCoordinateLabel.text = value
            }
            if let value = OfflineMode.shared.getString(with: .temperature) {
                 temperaturevalueLabel.text = value
             }
            if let value = OfflineMode.shared.getString(with: .pressure) {
                pressureValueLabel.text = value
            }
            if let value = OfflineMode.shared.getString(with: .humidity) {
                humidityValueLabel.text = value
            }
            if let value = OfflineMode.shared.getString(with: .cloudiness) {
                cloudinessValueLabel.text = value
            }
            if let value = OfflineMode.shared.getString(with: .uvIndex) {
                uvValueLabel.text = value
            }
            if let value = OfflineMode.shared.getString(with: .cityName) {
                cityNameLabel.text = value
            }
            
        }
        
    }
    
    @IBAction func serachNewLocPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
