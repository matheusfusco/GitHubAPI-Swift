//
//  PullRequestManager.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 24/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import Foundation

final class PullRequestManager: APIManager {
    static func getPullRequests(from repository: Repository, success: @escaping([PullRequest]) -> Void, failure: @escaping(NSError) -> Void) {
        let endpoint = Constants.URLs.pullRequests.replacingOccurrences(of: "{repo_full_name}", with: "\(repository.full_name)")
        self.GET(endpoint: endpoint, parameters: nil, success: { (json) in
            let prResponse = PullRequestResponse(dataJSON: json)
            success(prResponse.pullRequests)
        }) { (error) in
            failure(error)
        }
    }
}
