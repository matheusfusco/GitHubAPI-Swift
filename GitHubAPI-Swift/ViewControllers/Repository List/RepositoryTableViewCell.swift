//
//  RepositoryTableViewCell.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 25/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import UIKit
import Kingfisher

class RepositoryTableViewCell: UITableViewCell {
    
    //MARK: - Lets and Vars
    var repository: Repository? {
        didSet {
            self.repositoryNameLabel.text = repository?.full_name
            self.repositoryDescriptionLabel.text = repository?.descr
            self.repositoryOwnerLabel.text = repository?.ownerUsername
            self.numberOfForksLabel.text = "\((repository?.numberOfForks)!)"
            self.numberOfStarsLabel.text = "\((repository?.numberOfStars)!)"
//            self.repositoryOwnerPhotoImageView.kf.setImage(with: URL(string: "\((repository?.ownerPhoto)!)")!)
            
            self.repositoryOwnerPhotoImageView.kf.setImage(with: URL(string: "\((repository?.ownerPhoto)!)"), placeholder: UIImage(named: "userPhoto"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryDescriptionLabel: UILabel!
    
    @IBOutlet weak var repositoryOwnerPhotoImageView: UIImageView!
    
    @IBOutlet weak var repositoryOwnerLabel: UILabel!
    
    @IBOutlet weak var numberOfForksLabel: UILabel!
    
    @IBOutlet weak var numberOfStarsLabel: UILabel!
    
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
