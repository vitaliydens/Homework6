//
//  AddStudentViewController.swift
//  VitaliyPuhklii6
//
//  Created by Developer on 08.12.2019.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

enum StateAdd: String {
    case student = "Учні", free = "Вільні слухачі", off = "Вибули"
}
protocol AddDeleagte: class {
    func addStudent(name: String, group: StateAdd)
}

class AddStudentViewController: UIViewController {

    @IBOutlet private weak var tfName: UITextField!
    @IBOutlet private weak var tfType: UITextField!

    private let model = StudentsModel()
    private var state: StateAdd?

    weak var delegate: AddDeleagte?

    override func viewDidLoad() {
        super.viewDidLoad()
        let typePicker = UIPickerView()
        typePicker.delegate = self
        tfType.inputView = typePicker
    }

    @IBAction private func clickedBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction private func clickedBtnAdd(_ sender: Any) {
        guard !tfType.text!.isEmpty else {
            showAlert(msg: "Choose group to add")
            return
        }
        guard !tfName.text!.isEmpty else {
            showAlert(msg: "Name can`t be empty")
            return
        }
        delegate?.addStudent(name: tfName.text!, group: state!)
        dismiss(animated: true, completion: nil)
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

extension AddStudentViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return model.sections.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        state = StateAdd(rawValue: model.sections[row])
        tfType.text = model.sections[row]
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return model.sections[row]
    }
}
