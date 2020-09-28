//
//  People.swift
//  People
//
//  Created by David Yang on 28/09/2020.
//

import SwiftUI

struct People: Hashable, Codable, Identifiable {
    var id: Int
    var firstname: String
    var lastname: String
    var role: String
    var about: String
    var twitter: String?
}

extension People {
    var displayName: String {
        return "\(firstname) \(lastname)"
    }
}
