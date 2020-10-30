//
//  MenuTableCell.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 30/10/2020.
//

import UIKit

class MenuTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var cellTitle: String {
        get{titleLabel.text ?? K.emptyString}
        set{titleLabel.text = newValue}
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
