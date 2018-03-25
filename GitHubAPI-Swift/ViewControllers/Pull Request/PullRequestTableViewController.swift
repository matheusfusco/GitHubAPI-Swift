//
//  PullRequestTableViewController.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 24/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit

final class PullRequestTableViewController: UITableViewController {

    //MARK: - Lets and Vars
    private var pullRequests: [PullRequest] = []
    var repositoryToLoad: Repository?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configVariables()
        self.configViews()
        self.fetchPullRequests()
    }
    
    //MARK: - Custom Methods
    private func configVariables() {
        
    }
    
    private func configViews() {
        self.tableView.tableFooterView = UIView()
    }
    
    private func fetchPullRequests() {
        if let repository = repositoryToLoad {
            self.title = "\(repository.full_name)"
            self.showLoading()
            PullRequestManager.getPullRequests(from: repository, success: { (pRequests) in
                self.dismissLoading()
                self.pullRequests = pRequests
                self.tableView.reloadData()
            }) { (error) in
                self.dismissLoading()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.pullRequest, for: indexPath) as! PullRequestTableViewCell
        cell.pullRequest = self.pullRequests[indexPath.row]
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
        UIApplication.shared.open(URL(string: "\(pullRequests[indexPath.row].html_url)")!, options: [:], completionHandler: nil)
    }
}
