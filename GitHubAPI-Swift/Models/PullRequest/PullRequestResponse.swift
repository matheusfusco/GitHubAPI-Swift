//
//  PullRequestResponse.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 24/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import Foundation
import SwiftyJSON

class PullRequestResponse: NSObject {
    var pullRequests : [PullRequest] = [PullRequest]()
    
    convenience init(dataJSON: JSON) {
        self.init()
        self.pullRequests = [PullRequest]()
        
        if dataJSON.array != nil {
            let contentArray = dataJSON.arrayValue
            for pr in contentArray {
                let model = PullRequest(dataJSON: pr)
                self.pullRequests.append(model)
            }
        }
    }
}
