//
//  AuthButton.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 28/10/2020.
//

import UIKit

class AuthButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        layer.cornerRadius = 5
    }
    
    
}
