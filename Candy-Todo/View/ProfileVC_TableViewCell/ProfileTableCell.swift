//
//  ProfileTableCell.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 29/10/2020.
//

import UIKit

class ProfileTableCell: UITableViewCell {

    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var optionSwitch: UISwitch!
    
    var cellTitle: String {
        get{cellTitleLabel.text ?? K.emptyString}
        set{cellTitleLabel.text = newValue}
    }
    
    var optionSwitchState: Bool {
        get{optionSwitch.isOn}
        set{optionSwitch.setOn(newValue, animated: true)}
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func optionSwitched(_ sender: Any) {
        optionSwitchState = optionSwitch.isOn ? true : false
        print(optionSwitch.isOn)
    }
    
    func configure(title: String, state: Bool) {
        self.cellTitle = title
        self.optionSwitchState = state
    }
    
}
