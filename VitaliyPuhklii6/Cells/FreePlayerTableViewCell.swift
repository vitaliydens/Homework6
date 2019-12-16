//
//  FreePlayerTableViewCell.swift
//  VitaliyPuhklii6
//
//  Created by Developer on 30.11.2019.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

protocol UpClickedDelegate: AnyObject {
    func clickedUp(cell: UITableViewCell)
}

class FreePlayerTableViewCell: UITableViewCell {

    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var btnUpClicked: UIButton!

    weak var delegate: UpClickedDelegate?

    @IBAction private func btnUpClicked(_ sender: UIButton) {
        delegate?.clickedUp(cell: self)
    }

    var name: String? = "" {
        didSet {
            lblName.text = name
        }
    }
}
