//
//  NewTaskVC.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 30/10/2020.
//

import UIKit
import SideMenu

class NewTaskVC: UIViewController {

    var menu: SideMenuNavigationController?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.regCell(cellName: TextFieldTableCell.className)
        tableView.regCell(cellName: ProfileTableCell.className)
        setUpSidMenu(menu: &menu)
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        present(menu!, animated: true, completion: nil)
    }
    
    
    
    
}

extension NewTaskVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SectionHeaderView()
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableCell.className) as? TextFieldTableCell else { return UITableViewCell() }
            switch indexPath.row {
            case 0:
                cell.configure(title: "Complete by", placeHolder: "Select a Date", rightIcon: nil)
            case 1:
                cell.configure(title: "Priority", placeHolder: "", rightIcon: K.questionMark!)
            default:
                return UITableViewCell()
            }
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableCell.className) as? ProfileTableCell else { return UITableViewCell() }
            
            switch indexPath.row {
            case 0:
                cell.configure(title: "Save as alarm", state: false)
            case 1:
                cell.configure(title: "Save as notification", state: true)
            default:
                return UITableViewCell()
            }
            return cell
            
            
        default:
            return UITableViewCell()
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
