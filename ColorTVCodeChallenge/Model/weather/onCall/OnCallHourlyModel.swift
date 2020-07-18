//
//  OnCallHourlyModel.swift
//  ColorTVCodeChallenge
//
//  Created by Mohsen khodadadazadeh on 7/18/20.
//  Copyright © 2020 Mohsen khodadadazadeh. All rights reserved.
//

import Foundation
/**
        This model Uses for keeping hourly weathers and It is one of OnCallWeatherModel subsets' model
    - SeeAlso:  `OnCallWeatherModel.swift`
 
 */
struct OnCallHourlyModel: OnCallDefaultDataProtocol, Codable {
    
    var dt: Double
    /// Temperature. Unit Default: Kelvin
    var temp: Double
    
    var pressure: Int
    
    var humidity: Int
    /// Cloudiness, %
    var clouds: Double
    
    var rain: Double
    
    var snow: Double
    
    var wind_speed: Double
    
    var wind_deg: Int
    
    var dew_point: Double
     
    var weather: [OnCallDailyWeatherModel]
    
    
}
