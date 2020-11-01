//
//  ManuVC.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 30/10/2020.
//

import UIKit

class MenuVC: UITableViewController {
    
    var MenuItems = K.Menu.menu       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.regCell(cellName: MenuTableCell.className)
        tableView.regCell(cellName: Menu_UserTableCell.className)
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MenuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Menu_UserTableCell.className) as? Menu_UserTableCell else { return UITableViewCell() }

            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableCell.className) as? MenuTableCell else { return UITableViewCell() }

            cell.cellTitle = MenuItems[indexPath.row]
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 1:
            navigationController?.pushViewController(TodaysListVC.initVC(), animated: true)
        case 2:
            navigationController?.pushViewController(SchedulerVC.initVC(), animated: true)
        case 3:
            navigationController?.pushViewController(NotificationVC.initVC(), animated: true)
        case 4:
            navigationController?.pushViewController(ProfileVC.initVC(), animated: true)
        case 5:
            print("Logout cell tapped")
        default:
            break
        }
    }
    
    
}
