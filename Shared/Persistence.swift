//
//  Persistence.swift
//  SimpleToDoApp
//
//  Created by Herie Marie A. Estaño on 4/18/22.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TodoModel")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("unresolved error: \(error)")
            }
        })
    }
  
}
