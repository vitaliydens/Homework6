//
//  StudentTableViewCell.swift
//  VitaliyPuhklii6
//
//  Created by Developer on 30.11.2019.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var geekHubImgView: UIImageView!

    var name: String? = "" {
        didSet {
            lblName.text = name
        }
    }

    var imageGeek: UIImage? = nil {
        didSet {
            geekHubImgView.image = imageGeek
        }
    }
}
