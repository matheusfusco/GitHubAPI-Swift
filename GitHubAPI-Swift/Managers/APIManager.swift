//
//  APIManager.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 24/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIManager: NSObject {
    // MARK: - Lets and Vars
    static var header : HTTPHeaders = ["content-type" : "application/json"]
    
    
    // MARK: - Requests
    static func GET (endpoint: String, parameters: [String: Any]?, success: @escaping(JSON) -> Void, failure: @escaping(NSError) -> Void) {
        
        switch Reach().connectionStatus() {
        case .offline:
            failure(NSError(domain: "Sem conexão com a internet", code: 0, userInfo: nil))
            return
        case .unknown:
            failure(NSError(domain: "Erro desconhecido.", code: 500, userInfo: nil))
            return
        default:
            break
        }
        
        let url = URL(string: Constants.URLs.baseURL + endpoint)!
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: self.header)
            .responseJSON(completionHandler: { (response) in
                switch (response.result) {
                case .success:
                    let json = JSON(data: response.data!)
                    success(json)
                    
                case .failure:
                    let error = NSError(domain: "Erro desconhecido", code:response.response?.statusCode ?? 0, userInfo: nil)
                    failure(error)
                }
            })
    }
}
