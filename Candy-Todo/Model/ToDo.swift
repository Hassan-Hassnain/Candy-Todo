//
//  ToDo.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 31/10/2020.
//

import Foundation
import RealmSwift

class ToDo: Object {
    @objc dynamic var title: String
    @objc dynamic var done: Bool
    @objc dynamic var date: Date
    @objc dynamic var shouldAlarm: Bool
    @objc dynamic var shouldNotification: Bool
    
    override init() {
        self.title = ""
        self.done = false
        self.date = Date()
        shouldAlarm = false
        shouldNotification = true
    }
    
    init(title: String, stats: Bool, date: Date, alarm: Bool, notification: Bool) {
        self.title = title
        self.done = stats
        self.date = date
        self.shouldAlarm = alarm
        self.shouldNotification = notification
    }
}
