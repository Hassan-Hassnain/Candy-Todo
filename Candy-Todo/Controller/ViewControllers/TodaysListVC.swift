//
//  TodaysListVC.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 29/10/2020.
//

import UIKit
import SideMenu

class TodaysListVC: UIViewController {

    var menu: SideMenuNavigationController?
    var todos = [ToDo]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.regCell(cellName: ToDoCell.className)
        setUpSidMenu(menu: &menu)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        todos = DataManager.shared.getToDos()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        present(menu!, animated: true, completion: nil)
    }
    

    
}

extension TodaysListVC:UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ToDoCell.className) as? ToDoCell else { return UITableViewCell() }
        cell.title = todos[indexPath.row].title
        cell.isThisCellChecked = { state in
            if state { print("Cell is checked")} else { print("Cell unChecked--------")}
        }
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

