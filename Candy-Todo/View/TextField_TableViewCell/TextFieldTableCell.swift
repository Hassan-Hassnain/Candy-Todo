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
    
    var textDidChange_Handle: Handle_StringArg?
    let picker = UIDatePicker()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
    }
    
    func configure(title: String, placeHolder: String, rightIcon: UIImage?) {
        self.title = title
        self.placeHolder = placeHolder
        self.textFieldRightIcon = rightIcon
    }

    
}

extension TextFieldTableCell: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        fieldText = textField.text ?? ""
        textDidChange_Handle?(fieldText)
    }
    
    
}

