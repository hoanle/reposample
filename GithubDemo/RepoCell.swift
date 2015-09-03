//
//  RepoCell.swift
//  GithubDemo
//
//  Created by Hoan Le on 9/3/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var repoLabel: UILabel!
    
    
    @IBOutlet weak var ownerLabel: UILabel!
    
    
    @IBOutlet weak var starLabel: UILabel!
    
    
    @IBOutlet weak var forksLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        repoLabel.preferredMaxLayoutWidth = 120
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
