//
//  NetworkErrors.swift
//  ColorTVCodeChallenge
//
//  Created by Mohsen khodadadazadeh on 7/18/20.
//  Copyright © 2020 Mohsen khodadadazadeh. All rights reserved.
//

import Foundation

enum NetworkErrors: Error {
    case notFound
    case internalServerError
    case nilUrl
    case endOfChain
    case alamofireStatusCodeError
    case convertToDataError
    case alamofireError(errorDescription: String?)
    case unknownError(errorDescription: String?)
}

extension NetworkErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        
        case .notFound: return "URL Not found"
        
        case .internalServerError: return "An error accures on the server"
        
        case .endOfChain: return "Undifined error"
        
        case .nilUrl: return "Url was received nil"
        
        case .alamofireStatusCodeError: return "Alamofire can't reach statusCode class Network->\(#function)->\(#line)"
        
        case .convertToDataError: return "Network class can't transform value to dictionary class Network->\(#function)->\(#line)"
            
        case .alamofireError(let errorDescription): return "error when recevie data from API: \(String(describing: errorDescription)) \n class Network->\(#function)->\(#line)"
        
        case .unknownError(let errorDescription): return "new error was occured in line \(#line) , Network->\(#function): \(String(describing: errorDescription))"

        }
    }
}
