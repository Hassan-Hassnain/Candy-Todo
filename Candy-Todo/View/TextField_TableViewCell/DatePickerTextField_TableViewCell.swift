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
    var todoDate: Date?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setInputViewDatePicker()
    }
    
    func configure(title: String, placeHolder: String, rightIcon: UIImage?) {
        self.title = title
        self.placeHolder = placeHolder
        self.textFieldRightIcon = rightIcon
    }
    
    func setInputViewDatePicker () {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        
        toolbar.setItems([doneButton], animated: true)
        
        textField.inputAccessoryView = toolbar
        textField.inputView = picker
    }
    
    
    @objc func doneButtonTapped() {
        print(picker.date)
        fieldText = picker.date.toString()
        textDidChange_Handle?(picker.date)
        self.textField.resignFirstResponder()
    }
    
    
}



