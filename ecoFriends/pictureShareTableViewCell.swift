//
//  pictureShareTableViewCell.swift
//  ecoFriends
//
//  Created by  on 2/19/20.
//  Copyright © 2020 Appsorama. All rights reserved.
//

import UIKit

class pictureShareTableViewCell: UITableViewCell {

    @IBOutlet var sharedImage: UIImageView!
    @IBOutlet var imageCaption: UILabel!
    @IBOutlet var usernameButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
