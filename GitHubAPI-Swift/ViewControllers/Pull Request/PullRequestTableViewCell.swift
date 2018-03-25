//
//  PullRequestTableViewCell.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 25/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit

class PullRequestTableViewCell: UITableViewCell {

    //MARK: - Lets and Vars
    var pullRequest: PullRequest? {
        didSet {
            prTitleLabel.text = pullRequest?.title
            prDescriptionLabel.text = pullRequest?.body
            userNameLabel.text = pullRequest?.login
            userPhotoImageView.kf.setImage(with: URL(string: "\((pullRequest?.avatar_url)!)")!, placeholder: UIImage(named: "userPhoto"), options: nil, progressBlock: nil, completionHandler: nil)
            prDateLabel.text = DateUtils.convertDateToString((pullRequest?.created_at)!)
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var prTitleLabel: UILabel!
    @IBOutlet weak var prDescriptionLabel: UILabel!
    @IBOutlet weak var userPhotoImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var prDateLabel: UILabel!
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
