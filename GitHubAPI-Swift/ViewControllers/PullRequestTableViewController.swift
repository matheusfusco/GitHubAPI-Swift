//
//  PullRequestTableViewController.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 24/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit

class PullRequestTableViewController: UITableViewController {

    //MARK: - Lets and Vars
    var repositoryToLoad: Repository?
    var pullRequests: [PullRequest] = []
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configVariables()
        self.configViews()
        self.fetchPullRequests()
    }
    
    //MARK: - Custom Methods
    func configVariables() {
        
    }
    
    func configViews() {
        self.tableView.tableFooterView = UIView()
    }
    
    func fetchPullRequests() {
        if let repository = repositoryToLoad {
            PullRequestManager.getPullRequests(from: repository, success: { (pRequests) in
                self.pullRequests = pRequests
                self.tableView.reloadData()
            }) { (error) in
                
            }
        }
    }

    //MARK: - Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - TableView DataSource Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pullRequests.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.pullRequest, for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
