//
//  Constants.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 24/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    struct URLs {
        static let baseURL = "https://api.github.com"
        
        static let searchRepositories = "/search/repositories"
        //PARAMS:
        //q=language:Java //OU// q=language:Swift //OU// q=language:ObjectiveC
        //&sort=stars
        //&page=1
        //&order=asc //OU// desc
        
        static let pullRequests = "/repos/{repo_full_name}/pulls"
    }
    
    struct CellIdentifiers {
        static let repository = "repositoryCell"
        static let pullRequest = "pullRequestCell"
    }
}
