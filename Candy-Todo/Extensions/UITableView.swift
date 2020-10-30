//
//  UITableView.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 29/10/2020.
//

import UIKit
extension UITableView {
    func regCell(cellName: String){
        self.register(UINib(nibName:cellName,bundle: nil),forCellReuseIdentifier: cellName)
    }
    
}
