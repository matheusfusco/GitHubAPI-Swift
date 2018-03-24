//
//  Repository.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 24/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit
import SwiftyJSON

class Repository: NSObject {
    var full_name : String = ""
    var descr : String = ""
    var numberOfStars : Int = 0
    var numberOfForks : Int = 0
    var openIssues : Int = 0
    var ownerUsername : String = ""
    var ownerPhoto : String = ""
    
    convenience init(dataJSON: JSON) {
        self.init()
        self.full_name = dataJSON["full_name"].stringValue
        self.descr = dataJSON["description"].stringValue
        self.numberOfStars = dataJSON["watchers_count"].intValue
        self.numberOfForks = dataJSON["forks_count"].intValue
        self.openIssues = dataJSON["open_issues_count"].intValue
        self.ownerUsername = dataJSON["owner"]["login"].stringValue
        self.ownerPhoto = dataJSON["owner"]["avatar_url"].stringValue
    }
}
