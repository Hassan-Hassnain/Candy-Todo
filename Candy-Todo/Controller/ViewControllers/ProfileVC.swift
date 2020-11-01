//
//  ProfileVC.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 29/10/2020.
//

import UIKit
import SideMenu

class ProfileVC: UIViewController {

    var menu: SideMenuNavigationController?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var avatorImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var image: UIImage? {
        get{avatorImageView.image ?? nil}
        set{avatorImageView.image = newValue}
    }
    
    var name: String {
        get{nameLabel.text ?? K.emptyString}
        set{nameLabel.text = newValue}
    }
    
    var email: String {
        get{emailLabel.text ?? K.emptyString}
        set{emailLabel.text = newValue}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.regCell(cellName: ProfileTableCell.className)
        avatorImageView.layer.cornerRadius = avatorImageView.frame.width/2
        setUpSidMenu(menu: &menu)
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        present(menu!, animated: true, completion: nil)
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        navigationController?.pushViewController((storyboard?.instantiateViewController(withIdentifier: EditProfileVC.className))!, animated: true)
    }
    
    
    
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SectionHeaderView()
        headerView.setLeadingConstructing(value: 00.0)
        setSectionHeaderTitle(section, headerView)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableCell.className) as? ProfileTableCell else { return UITableViewCell() }
        populateCells(indexPath, cell)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

//MARK: - View Controller helper functions
extension ProfileVC {
    
    
    fileprivate func setSectionHeaderTitle(_ section: Int, _ headerView: SectionHeaderView) {
        switch section {
        case 0:
            headerView.headerText = K.Profile.SectionHeader.zero
        case 1:
            headerView.headerText = K.Profile.SectionHeader.one
            
        default:
            break
        }
    }
    
    fileprivate func populateCells(_ indexPath: IndexPath, _ cell: ProfileTableCell) {
        switch indexPath.section {
        case 0:
            populateSection_One(indexPath, cell)
        case 1:
            populateSection_Two(indexPath, cell)
            
        default:
            break
        }
    }
    
    fileprivate func populateSection_One(_ indexPath: IndexPath, _ cell: ProfileTableCell) {
        switch indexPath.row {
        case 0:
            cell.cellTitle = K.Profile.Cell.getEmailNotification
        case 1:
            cell.cellTitle = K.Profile.Cell.vibrateOnAlert
        default:
            break
        }
    }
    
    fileprivate func populateSection_Two(_ indexPath: IndexPath, _ cell: ProfileTableCell) {
        switch indexPath.row {
        case 0:
            cell.cellTitle = K.Profile.Cell.shareProfileWithFlossUser
        case 1:
            cell.cellTitle = K.Profile.Cell.showTaskCompletionStatus
        default:
            break
        }
    }
    
}
