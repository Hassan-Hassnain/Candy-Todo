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
    var todo = ToDo()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.regCell(cellName: DatePickerTextField_TableViewCell.className)
        tableView.regCell(cellName: TextFieldTableCell.className)
        tableView.regCell(cellName: ProfileTableCell.className)
        setUpSidMenu(menu: &menu)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        present(menu!, animated: true, completion: nil)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        print(todo)
        DataManager.shared.save(todo: todo)
        DataManager.shared.printDatabaseFileURL()
        
        self.tabBarController!.selectedIndex = 0
    }
    
    
}

extension NewTaskVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { 2 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 2 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return populateTableView(indexPath, tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
