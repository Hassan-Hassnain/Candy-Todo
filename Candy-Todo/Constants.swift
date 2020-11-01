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
    
    
    struct Profile {
        struct SectionHeader {
            static let zero = "Notification Settings"
            static let one = "Floss Settings"
        }
        struct Cell {
            static let getEmailNotification = "Get email notifications"
            static let vibrateOnAlert = "Vibrate on alert"
            static let shareProfileWithFlossUser = "Share profile with other floss users"
            static let showTaskCompletionStatus = "Show your task completion status"
        }
    }
    
    struct Menu {
        static let menu = ["Cell for user Info", "To-do", "Scheduler", "Notification", "Profile", "Logout"]
    }
    
    struct DummyUser {
        static let title = "Email"
        static let placeHolder = "john@email.com"
        
    }
    
    
}


//MARK: - CLOSURE

typealias Handle_BoolArg = (Bool) -> Void
typealias Handle_StringArg = (String) -> Void
typealias Handle_DateArg = (Date) -> Void
