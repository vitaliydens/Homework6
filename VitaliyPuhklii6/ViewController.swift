//
//  ViewController.swift
//  VitaliyPuhklii6
//
//  Created by Developer on 30.11.2019.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var model = StudentsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "StudentTableViewCell", bundle: nil), forCellReuseIdentifier: "StudentTableViewCell")
        tableView.register(UINib(nibName: "FreePlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "FreePlayerTableViewCell")
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return model.students.count
        case 1:
            return model.free.count
        case 2:
            return model.off.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell") as! StudentTableViewCell
            cell.geekHubImgView?.image = #imageLiteral(resourceName: "logo_contrast")
            cell.lblName.text = model.students[indexPath.row]
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FreePlayerTableViewCell") as! FreePlayerTableViewCell
            cell.delegate = self
            cell.lblName.text = model.free[indexPath.row]
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell") as! StudentTableViewCell
            cell.geekHubImgView.image = #imageLiteral(resourceName: "logo_gray")
            cell.lblName.text = model.off[indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.sections[section]
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            switch indexPath.section {
            case 0:
                let student = model.students[indexPath.row]
                model.off.append(student)
                model.students.remove(at: indexPath.row)
            case 1:
                let free = model.free[indexPath.row]
                model.off.append(free)
                model.free.remove(at: indexPath.row)
            case 2:
                model.off.remove(at: indexPath.row)
            default:
                return
            }
            tableView.reloadData()
        }
    }
}

extension ViewController: UpClickedDelegate {
    func clickedUp(cell: UITableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let free = model.free[indexPath .row]
            model.students.append(free)
            model.free.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
}

