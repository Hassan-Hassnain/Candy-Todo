//
//  Constants.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 29/10/2020.
//

import UIKit


//MARK: - APPS  CONSTANTS
struct K {
    static let checkMark = UIImage(named: "CheckMark")
    static let alertMark = UIImage(named: "AlertMark")
    static let questionMark = UIImage(named: "QuestionMark")
    static let emptyString = ""
    static let yesterday = "Yesterday"
    static let today = "Today"
    static let tomorrow = "Tomorrow"
    
}


//MARK: - CLOSURE

typealias Handle_BoolArg = (Bool) -> Void
typealias Handle_StringArg = (String) -> Void
typealias Handle_DateArg = (Date) -> Void
