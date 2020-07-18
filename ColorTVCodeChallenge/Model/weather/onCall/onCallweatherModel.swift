//
//  onCallweatherModel.swift
//  ColorTVCodeChallenge
//
//  Created by Mohsen khodadadazadeh on 7/18/20.
//  Copyright © 2020 Mohsen khodadadazadeh. All rights reserved.
//

import Foundation
/**
            This model is used as the base model for OnCall API Model
 */
struct OnCallWeatherModel: Codable {
   
    
    /// Geographical coordinates of the location (latitude)
    var lat: Double
    /// Geographical coordinates of the location (longitude)
    var lon: Double
    /// Timezone name for the requested location
    var timezone: String
    /// Shift in seconds from UTC
    private var timezone_offset: Double
    /// current day
    var current: OnCallCurrentWeatherModel
    /// Daily forecast weather data API response
    //var daily: [OnCallDailyModel]?
    /// Hourly forecast weather data API response
    //var hourly: [OnCallHourlyModel]?
    
    
}
