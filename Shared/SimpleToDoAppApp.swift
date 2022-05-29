//
//  SimpleToDoAppApp.swift
//  Shared
//
//  Created by Herie Marie A. Estaño on 4/14/22.
//

import SwiftUI

@main
struct SimpleToDoAppApp: App {
    
    var body: some Scene {
        
        let persistentContainer = PersistenceController.shared
        
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentContainer.container.viewContext)
        }
    }
}
