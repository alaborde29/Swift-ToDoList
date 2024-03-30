//
//  User.swift
//  ToDoList
//
//  Created by Alexandre Laborde on 15/03/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
