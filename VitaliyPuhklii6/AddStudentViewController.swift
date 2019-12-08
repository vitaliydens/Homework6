//
//  AddStudentViewController.swift
//  VitaliyPuhklii6
//
//  Created by Developer on 08.12.2019.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

enum StateAdd: String {
    case student, free, off
}
protocol AddDeleagte: class {
    func addStudent(name: String, group: StateAdd)
}

class AddStudentViewController: UIViewController {
    
    @IBOutlet private weak var btnStudent: UIButton!
    @IBOutlet private weak var btnFree: UIButton!
    @IBOutlet private weak var btnOff: UIButton!
    @IBOutlet private weak var tfName: UITextField!
    
    private var state: StateAdd?
    
    var delegate: AddDeleagte?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func clickedBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickedBtnAdd(_ sender: Any) {
        guard let state = state else {
            showAlert(msg: "Choose group to add")
            return
        }
        guard let name = tfName.text, !name.isEmpty else {
            showAlert(msg: "Name can`t be empty")
            return
        }
        delegate?.addStudent(name: name, group: state)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickedOff(_ sender: Any) {
        state = .off
    }
    
    @IBAction func clickedFree(_ sender: Any) {
        state = .free
    }
    
    @IBAction func clickedStudent(_ sender: Any) {
        state = .student
    }
    
    private func showAlert(msg: String) {
        let alert = UIAlertController(title: msg, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension AddStudentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
