//
//  onCallCurrentWeatherModel.swift
//  ColorTVCodeChallenge
//
//  Created by Mohsen khodadadazadeh on 7/18/20.
//  Copyright © 2020 Mohsen khodadadazadeh. All rights reserved.
//

import Foundation

struct OnCallCurrentWeatherModel: OnCallDefaultDataProtocol, Codable {
    var dt: Double
    
    var pressure: Int
    
    var humidity: Int
    
    var dew_point: Double
    
    var wind_speed: Double
    
    var wind_deg: Int
    
    var clouds: Int
    
    var uvi: Double
    
    var weather: [OnCallDailyWeatherModel]
    /// Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
    var temp: Double
    
    
    
    
}
