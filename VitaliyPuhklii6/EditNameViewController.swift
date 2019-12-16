//
//  EditNameViewController.swift
//  VitaliyPuhklii6
//
//  Created by Developer on 08.12.2019.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

protocol SaveDelegate: class {
    func saveStudent(newName: String, oldName: String)
}

class EditNameViewController: UIViewController {

    @IBOutlet private weak var tfName: UITextField!

    var name: String!

    weak var delegate: SaveDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let rootViewController = navigationController?.viewControllers.first as? ViewController {
            delegate = rootViewController
        }
        tfName.text = name
        let rightBtn = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(clickedSave))
        self.navigationItem.setRightBarButton(rightBtn, animated: true)
    }

    @objc func clickedSave() {
        delegate?.saveStudent(newName: tfName.text!, oldName: name)
        navigationController?.popToRootViewController(animated: true)
    }
}
