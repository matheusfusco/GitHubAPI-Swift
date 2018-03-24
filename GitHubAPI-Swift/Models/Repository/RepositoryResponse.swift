//
//  RepositoryResponse.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 24/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import Foundation
import SwiftyJSON

class RepositoryResponse: NSObject {
    var repositories : [Repository] = [Repository]()
    
    convenience init(dataJSON: JSON) {
        self.init()
        self.repositories = [Repository]()
        
        if dataJSON["items"].array != nil {
            let contentArray = dataJSON["items"].arrayValue
            for repo in contentArray {
                let model = Repository(dataJSON: repo)
                self.repositories.append(model)
            }
        }
    }
}
