//
//  DataService.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 31/10/2020.
//

import Foundation
import RealmSwift

class DataManager {
    static let shared = DataManager()
    
    let realm = try! Realm()
    
    func printDatabaseFileURL(){
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
    }
    
    func save(todo: ToDo) {
        try! realm.write{
            realm.add(todo)
        }
    }
    
    func getToDos()->[ToDo] {
        let results =  realm.objects(ToDo.self)
        var todos = [ToDo]()
        for result in results {
            todos.append(result)
        }
        return todos
    }
    
}
