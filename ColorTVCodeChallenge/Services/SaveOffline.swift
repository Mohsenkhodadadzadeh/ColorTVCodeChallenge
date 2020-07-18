//
//  SaveOffline.swift
//  ColorTVCodeChallenge
//
//  Created by Mohsen khodadadazadeh on 7/18/20.
//  Copyright © 2020 Mohsen khodadadazadeh. All rights reserved.
//

import Foundation

class OfflineMode {
    
    public static let shared = OfflineMode()
    
    let defaults = UserDefaults.standard
    
    private init() {
        
    }
    
    func save (_ value: Any, forKey key: OfflineModeKeysEnum) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    func getString (with key: OfflineModeKeysEnum) -> String? {
        return defaults.string(forKey: key.rawValue)
    }
    
    func getDouble(with key: OfflineModeKeysEnum) -> Double {
        return defaults.double(forKey: key.rawValue)
    }
    
    func getInt(with key: OfflineModeKeysEnum) -> Int {
        return defaults.integer(forKey: key.rawValue)
    }
    
}
