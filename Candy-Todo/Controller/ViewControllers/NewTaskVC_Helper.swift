//
//  NewTaskVC_Helper.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 31/10/2020.
//

import UIKit

extension NewTaskVC {
    
    func populateTableView(_ indexPath: IndexPath, _ tableView: UITableView) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return populateSection_One(indexPath, tableView)
        case 1:
            return populateSection_Two(indexPath, tableView)
            
        default:
            return UITableViewCell()
        }
    }
    
    func populateSection_One(_ indexPath: IndexPath, _ tableView: UITableView) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return addDatePickerTextFieldToTableViewCell(indexPath, tableView)
        case 1:
            return addTextFieldToTableViewCell(indexPath, tableView)
        default:
            return UITableViewCell()
        }
    }
    
    func populateSection_Two(_ indexPath: IndexPath, _ tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableCell.className) as? ProfileTableCell else { return UITableViewCell() }
        
        switch indexPath.row {
        case 0:
            cell.configure(title: "Save as alarm", state: false)
            cell.optionChanged_Handle = { state in self.todo.shouldAlarm = state}
        case 1:
            cell.configure(title: "Save as notification", state: true)
            cell.optionChanged_Handle = { notification in self.todo.shouldNotification = notification}
        default:
            return UITableViewCell()
        }
        return cell
        
    }
    
    func addDatePickerTextFieldToTableViewCell(_ indexPath: IndexPath, _ tableView: UITableView) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DatePickerTextField_TableViewCell.className) as? DatePickerTextField_TableViewCell else { return UITableViewCell() }
        cell.configure(title: "Complete by", placeHolder: "Select a Date", rightIcon: nil)
        cell.textDidChange_Handle = { date in
            self.todo.date = date
        }
        return cell
    }
    
    func addTextFieldToTableViewCell(_ indexPath: IndexPath, _ tableView: UITableView) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableCell.className) as? TextFieldTableCell else { return UITableViewCell() }
        cell.configure(title: "Priority", placeHolder: "", rightIcon: K.questionMark!)
        cell.textDidChange_Handle = { title in
            self.todo.title = title
        }
        return cell
    }
    
    
}

