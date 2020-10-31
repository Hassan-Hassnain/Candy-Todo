//
//  DatePickerTextField_TableViewCell.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 31/10/2020.
//

import UIKit

class DatePickerTextField_TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: AuthTextField!
    
    var title: String {
        get{titleLabel.text ?? ""}
        set{titleLabel.text = newValue}
    }
    
    var fieldText: String {
        get{textField.text ?? ""}
        set{textField.text = newValue}
    }
    
    var placeHolder: String {
        get{textField.placeholder ?? ""}
        set{textField.placeholder = newValue}
    }
    
    var textFieldRightIcon: UIImage? {
        get{nil}
        set{textField.rightImage = newValue}
    }
    
    var textDidChange_Handle: Handle_DateArg?
    let picker = UIDatePicker()
    var todoDate = Date()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
        self.textField.setInputViewDatePicker(target: self, selector: #selector(tapDone(sender:datePicker1:))) //1
        textField.inputView = picker
    }
    
    func configure(title: String, placeHolder: String, rightIcon: UIImage?) {
        self.title = title
        self.placeHolder = placeHolder
        self.textFieldRightIcon = rightIcon
    }
    
    
    @objc func tapDone(sender: Any, datePicker1: UIDatePicker) {
        print(datePicker1)
        if let datePicker = self.textField.inputView as? UIDatePicker { // 2.1
            let dateformatter = DateFormatter() // 2.2
            dateformatter.dateStyle = .medium // 2.3
            self.textField.text = dateformatter.string(from: datePicker.date) //2.4
        }
        self.textField.resignFirstResponder() // 2.5
    }
    
    
}

extension DatePickerTextField_TableViewCell: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        fieldText = textField.text ?? ""
        textDidChange_Handle?(todoDate)
    }
    
    
}


