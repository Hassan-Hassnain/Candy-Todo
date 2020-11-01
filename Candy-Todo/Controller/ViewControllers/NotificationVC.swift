//
//  NotificationVC.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 29/10/2020.
//

import UIKit
import SideMenu

class NotificationVC: UIViewController {
    
    var menu: SideMenuNavigationController?
    var todos = [[ToDo]]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.regCell(cellName: ToDoCell.className)
        setUpSidMenu(menu: &menu)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        filterGroupTodosByDate()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        present(menu!, animated: true, completion: nil)
    }
    
    func filterGroupTodosByDate(){
        let grouppedTodo = Dictionary(grouping: DataManager.shared.getToDos()) { (element) -> Date in
            return element.date.reduceToMonthDayYear()
        }
        
        let sortedKeys = grouppedTodo.keys.sorted()
        sortedKeys.forEach{ (key) in
            let values = grouppedTodo[key]
            let isComingDateTodo = values?.first?.date.reduceToMonthDayYear().compare(Date().reduceToMonthDayYear()) != .orderedAscending
            if isComingDateTodo {
                todos.append(values ?? [])
            }
        }
    }
    
    
    
}

extension NotificationVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerViewForSection(section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForRow(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension NotificationVC {
    
    func headerViewForSection(_ section: Int) -> UIView? {
        let headerView = SectionHeaderView()
        if let firstTodoInSection = todos[section].first {
            //            headerView.headerText = firstTodoInSection.date.toString()
            headerView.headerText = getSectionHeaderText(from: firstTodoInSection.date)
        }
        return headerView
    }
    
    func getSectionHeaderText(from date: Date) -> String {
        if Date().reduceToMonthDayYear().compare(date.nextDate().reduceToMonthDayYear()) == .orderedSame {
            return K.yesterday
        } else if Date().reduceToMonthDayYear().compare(date.reduceToMonthDayYear()) == .orderedSame {
            return K.today
        } else if Date().reduceToMonthDayYear().compare(date.previousDate().reduceToMonthDayYear()) == .orderedSame {
            return K.tomorrow
        } else {
            return date.toString()
        }
    }
    
    func cellForRow(at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ToDoCell.className) as? ToDoCell else { return UITableViewCell() }
        cell.title = todos[indexPath.section][indexPath.row].title
        cell.isFilled = true
        cell.isThisCellChecked = { state in
            if state { print("Cell is checked")} else { print("Cell unChecked--------")}
        }
        return cell
    }
    
}
