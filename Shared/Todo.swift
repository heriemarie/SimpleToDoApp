//
//  Todo.swift
//  SimpleToDoApp
//
//  Created by Herie Marie A. Estaño on 4/14/22.
//

import Foundation
import SwiftUI


struct Todo: Identifiable {
    let id = UUID()
    let name: String
    let category: String
}
