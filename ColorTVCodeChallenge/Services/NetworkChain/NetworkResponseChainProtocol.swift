//
//  NetworkResponseChainProtocol.swift
//  ColorTVCodeChallenge
//
//  Created by Mohsen khodadadazadeh on 7/18/20.
//  Copyright © 2020 Mohsen khodadadazadeh. All rights reserved.
//

import Foundation

protocol NetworkResponseChainProtocol {
    
    func calculate <T: Codable>(_ unserilized: Data, status: Int) throws -> T
    var next: NetworkResponseChainProtocol? { get set}
}
