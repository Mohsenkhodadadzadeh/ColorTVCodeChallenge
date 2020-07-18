//
//  Response200.swift
//  ColorTVCodeChallenge
//
//  Created by Mohsen khodadadazadeh on 7/18/20.
//  Copyright © 2020 Mohsen khodadadazadeh. All rights reserved.
//

import Foundation

class Response200: NetworkResponseChainProtocol {
    func calculate<T: Codable>(_ unserilized: Data, status: Int) throws -> T {
        
        if status == 200 {
            let retObj = try! JSONDecoder().decode(T.self, from: unserilized)
            return retObj
        } else {
            if next != nil {
                return try next!.calculate(unserilized, status: status)
            }
            throw(NetworkErrors.endOfChain)
        }
    }
    var next: NetworkResponseChainProtocol?
}
