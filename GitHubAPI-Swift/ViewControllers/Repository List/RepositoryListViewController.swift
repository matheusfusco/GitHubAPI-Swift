//
//  RepositoryListViewController.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 24/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit

final class RepositoryListViewController: UIViewController {

    //MARK: - Lets and Vars
    private var repositories: [Repository] = []
    var selectedRepository: Repository?
    
    //MARK: - IBOutlets
    @IBOutlet weak var repositoryTableView: UITableView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configVariables()
        self.configViews()
        self.fetchRepositories()
    }
    
    //MARK: - Custom Methods
    private func configVariables() {
        
    }
    
    private func configViews() {
        repositoryTableView.tableFooterView = UIView()
    }

    private func fetchRepositories() {
        self.showLoading()
        RepositoryManager.getRepositories(success: { (repos) in
            self.dismissLoading()
            self.repositories = repos
            self.repositoryTableView.reloadData()
        }) { (error) in
            self.dismissLoading()
        }
    }
    
    //MARK: - Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let prVC = segue.destination as? PullRequestTableViewController {
            if let repo = selectedRepository {
                prVC.repositoryToLoad = repo
            }
        }
    }

}

//MARK: - UITableView Delegate & DataSource Methods
extension RepositoryListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRepository = self.repositories[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: Constants.SegueIdentifiers.showPullRequests, sender: self)
    }
}

extension RepositoryListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.repository, for: indexPath) as! RepositoryTableViewCell
        cell.repository = self.repositories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 127
    }
}

