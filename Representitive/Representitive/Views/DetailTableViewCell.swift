//
//  DetailTableViewCell.swift
//  Representitive
//
//  Created by Jordan Lamb on 10/2/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!

    func updateViews() {
        nameLabel.text = representative?.name
        partyLabel.text = representative?.party
        districtLabel.text = representative?.district
        websiteLabel.text = representative?.link
        phoneLabel.text = representative?.phone
    }
}
