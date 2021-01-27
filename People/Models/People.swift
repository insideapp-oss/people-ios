//
//  People.swift
//  People
//
//  Created by David Yang on 28/09/2020.
//

import SwiftUI

class People: ObservableObject, Codable, Identifiable {

    enum CodingKeys: CodingKey {
        case id
        case firstname
        case lastname
        case role
        case about
        case twitter
    }

    @Published var id: Int = -1
    @Published var firstname: String = ""
    @Published var lastname: String = ""
    @Published var role: String = ""
    @Published var about: String = ""
    @Published var twitter: String? = nil

    init(id: Int = -1, firstname: String = "", lastname: String = "", role: String = "", about: String = "", twitter: String? = nil) {
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.role = role
        self.about = about
        self.twitter = twitter
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        firstname = try container.decode(String.self, forKey: .firstname)
        lastname = try container.decode(String.self, forKey: .lastname)
        role = try container.decode(String.self, forKey: .role)
        about = try container.decode(String.self, forKey: .about)
        twitter = try container.decodeIfPresent(String.self, forKey: .twitter)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(firstname, forKey: CodingKeys.firstname)
        try container.encode(lastname, forKey: CodingKeys.lastname)
        try container.encode(role, forKey: CodingKeys.role)
        try container.encode(about, forKey: CodingKeys.about)
        try container.encode(twitter, forKey: CodingKeys.twitter)
    }
}

extension People {
    static var all: [People] = DataHelper.load("peoples.json")

    var displayName: String {
        return "\(firstname) \(lastname)"
    }
}
