//
//  SchedulerVCViewController.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 29/10/2020.
//

import UIKit
import SideMenu

class SchedulerVC: UIViewController {

    var menu: SideMenuNavigationController?
    var todos = [[ToDo]]()
//    var groupedTodos = [[ToDo]]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.regCell(cellName: ToDoCell.className)
        setUpSidMenu(menu: &menu)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        todos = DataManager.shared.getToDos()
        groupTodosByDate()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }    
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        present(menu!, animated: true, completion: nil)
    }
    
    func groupTodosByDate(){
        let grouppedTodo = Dictionary(grouping: DataManager.shared.getToDos()) { (element) -> Date in
            return element.date
        }
        
        grouppedTodo.keys.forEach{ (key) in
            let values = grouppedTodo[key]
            
            values?.forEach{
                print("\($0.date) TITLE = \($0.title)")
                todos.append(values ?? [])
                print(todos)
            }
        }
    }
    
}

extension SchedulerVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = SectionHeaderView()
        if let firstTodoInSection = todos[section].first {
            headerView.headerText = firstTodoInSection.date.toString()
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ToDoCell.className) as? ToDoCell else { return UITableViewCell() }
        cell.title = todos[indexPath.section][indexPath.row].title
        cell.isThisCellChecked = { state in
            if state { print("Cell is checked")} else { print("Cell unChecked--------")}
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
