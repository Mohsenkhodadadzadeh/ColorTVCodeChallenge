//
//  OnCallDailyModel.swift
//  ColorTVCodeChallenge
//
//  Created by Mohsen khodadadazadeh on 7/18/20.
//  Copyright © 2020 Mohsen khodadadazadeh. All rights reserved.
//

import Foundation

struct OnCallDailyModel: OnCallDefaultDataProtocol, Codable {
    
    var dt: Double
    
    var sunrise: Int
    
    var sunset: Int
    
    var temp: OnCallDayTempModel
    
    var pressure: Int
    
    var humidity: Int
    
    var dew_point: Double
    
    var wind_speed: Double
    
    var wind_deg: Int
    
    var weather: [OnCallDailyWeatherModel]
    
    var clouds: Double
    
    var rain: Double
    
    var snow: Double
    
    var uvi: Double
}

struct OnCallDayTempModel: Codable {
    
    var day: Double
    
    var min: Double
    
    var max: Double
    
    var night: Double
    
    var evening: Double
    
    var morning: Double
}
