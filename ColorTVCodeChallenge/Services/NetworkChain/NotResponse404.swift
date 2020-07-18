//
//  NotResponse404.swift
//  ColorTVCodeChallenge
//
//  Created by Mohsen khodadadazadeh on 7/18/20.
//  Copyright © 2020 Mohsen khodadadazadeh. All rights reserved.
//

import Foundation

class NotResponse404: NetworkResponseChainProtocol {
    func calculate<T: Codable>(_ unserilized: Data, status: Int) throws -> T {
        if status == 404 {
            throw(NetworkErrors.notFound)
        } else {
            if next != nil {
                return try next!.calculate(unserilized, status: status)
            }
            throw(NetworkErrors.endOfChain)
        }
    }
    var next: NetworkResponseChainProtocol?
}
