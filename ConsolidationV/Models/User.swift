//
//  User.swift
//  ConsolidationV
//
//  Created by Vincent Salinas on 9/12/22.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String?
    var isActive: Bool?
    var name: String?
    var age: Int?
    var company: String?
    var email: String?
    var address: String?
    var about: String?
    var registered: String?
    var tags: [String]?
    var friends: [Friend]?
}
