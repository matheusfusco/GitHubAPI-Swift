//
//  RepositoryManager.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 24/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import Foundation

class RepositoryManager: NSObject {
    static func getRepositories(success: @escaping([Repository]) -> Void, failure: @escaping(NSError) -> Void) {
        let endpoint = Constants.URLs.searchRepositories
        let params = ["q" : "language:Swift"]
        APIManager.GET(endpoint: endpoint, parameters: params, success: { (json) in
            let repositoryResponse = RepositoryResponse(dataJSON: json)
            success(repositoryResponse.repositories)
        }) { (error) in
            failure(error)
        }
    }
}
