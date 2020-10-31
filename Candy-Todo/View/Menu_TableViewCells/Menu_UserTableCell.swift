//
//  Menu_UserTableCell.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 30/10/2020.
//

import UIKit

class Menu_UserTableCell: UITableViewCell {

    @IBOutlet weak var avatorImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var profileImage: UIImage? {
        get{avatorImageView.image ?? nil}
        set{avatorImageView.image = newValue}
    }
    
    var name: String {
        get{nameLabel.text ?? ""}
        set{nameLabel.text =  newValue}
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatorImageView.layer.cornerRadius = avatorImageView.frame.width/2
    }

    func configure(name: String, image: UIImage) {
        self.profileImage = image
        self.name = name
    }
    
}
