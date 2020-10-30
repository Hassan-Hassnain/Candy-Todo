//
//  NSObject.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 29/10/2020.
//


import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
