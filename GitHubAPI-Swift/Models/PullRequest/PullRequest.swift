//
//  PullRequest.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 24/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit
import SwiftyJSON

class PullRequest: NSObject {
    var title : String = ""
    var created_at : String = ""
    var body : String = ""
    var login : String = ""
    var avatar_url : String = ""
    var html_url : String = ""
    
    convenience init(dataJSON: JSON) {
        self.init()
        self.title = dataJSON["title"].stringValue
        self.created_at = dataJSON["created_at"].stringValue
        self.body = dataJSON["body"].stringValue
        self.login = dataJSON["user"]["login"].stringValue
        self.avatar_url = dataJSON["user"]["avatar_url"].stringValue
        self.html_url = dataJSON["html_url"].stringValue
    }
}
