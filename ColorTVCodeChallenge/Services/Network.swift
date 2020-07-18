//
//  Network.swift
//  ColorTVCodeChallenge
//
//  Created by Mohsen khodadadazadeh on 7/18/20.
//  Copyright © 2020 Mohsen khodadadazadeh. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    
    func getData<T: Codable>(url: URL?, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding = JSONEncoding.default, headers: HTTPHeaders?, success _success: @escaping(T) -> Void, failure _failure: @escaping(NetworkErrors) -> Void) {
        
        let success: (T) -> Void = { value in
            DispatchQueue.main.async { _success(value) }
        }
        
        let failure: (NetworkErrors) -> Void = { error in
            DispatchQueue.main.async { _failure(error) }
        }
        
        guard let strongUrl = url else {
            failure(NetworkErrors.nilUrl)
            return
        }
        
        var state200: NetworkResponseChainProtocol = Response200()
        var state404: NetworkResponseChainProtocol = NotResponse404()
        let state500: NetworkResponseChainProtocol = ServerError500()
        
        state200.next = state404
        state404.next = state500
        
        AF.request(strongUrl, method: method, parameters: parameters,
                   encoding: encoding, headers: headers)
            .validate()
            .response { response in
                
                switch response.result {
                case let .success(value):
                    if let returnValue = value {
                        if let statusCode = response.response?.statusCode {
                            do {
                                let value: T = try state200.calculate(returnValue, status: statusCode)
                                success(value)
                            } catch {
                                if let err = error as? NetworkErrors {
                                    failure(err)
                                } else {
                                    failure(.unknownError(errorDescription: error.localizedDescription))
                                }
                                
                            }
                            
                        } else {
                            failure(.alamofireStatusCodeError)
                        }
                    } else {
                        failure(.convertToDataError)
                        
                    }
                case let .failure(afError):
                    // handle error message later
                    failure(.alamofireError(errorDescription: afError.errorDescription))
                }
        }
        
    }
    
    
    func reachability(state _state: @escaping(Bool) -> Void) {
        let manager = NetworkReachabilityManager(host: "www.google.com")
        manager?.startListening { status in
            _state(manager?.isReachable ?? false)
        }
    }
}
