//
//  EditViewController.swift
//  VitaliyPuhklii6
//
//  Created by Developer on 08.12.2019.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet private weak var lblName: UILabel!
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = name
        title = "Details"
        let image = UIImage(named: "edit")
        let rightBtn = UIBarButtonItem(title: nil, style: .plain, target: self, action: #selector(clickedEdit))
        rightBtn.image = image
        self.navigationItem.setRightBarButton(rightBtn, animated: true)
    }
    
    @objc func clickedEdit() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditNameViewController") as! EditNameViewController
        vc.name = name
        navigationController?.pushViewController(vc, animated: true)
    }

}
