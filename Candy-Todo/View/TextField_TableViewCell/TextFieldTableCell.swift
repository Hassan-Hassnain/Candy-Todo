//
//  TextFieldTableCell.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 30/10/2020.
//

import UIKit

class TextFieldTableCell: UITableViewCell {

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectDate))
        textField.addGestureRecognizer(tapGesture)
    }
    
    func configure(title: String, placeHolder: String, rightIcon: UIImage?) {
        self.title = title
        self.placeHolder = placeHolder
        self.textFieldRightIcon = rightIcon
    }
    
    @objc func selectDate() {
        let datePicker = UIDatePicker()
        let components = Calendar.current.dateComponents([.year, .month, .day], from: datePicker.date)
        if let day = components.day, let month = components.month, let year = components.year {
            print("\(day) \(month) \(year) \nfull date \(components)")
        }
    }
    
}
