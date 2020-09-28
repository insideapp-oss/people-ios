//
//  PeopleRow.swift
//  People
//
//  Created by David Yang on 28/09/2020.
//

import SwiftUI

struct PeopleRow: View {
    var people: People

    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill").font(.title)
            VStack(alignment: .leading) {
                Text(people.firstname + " " + people.lastname)
                Text(people.role).font(.caption).foregroundColor(.gray)
            }
        }.padding(4)
    }
}

struct PeopleRow_Previews: PreviewProvider {
    static var previews: some View {
        PeopleRow(people: People(id: 0, firstname: "Steve", lastname: "Rogers", role: "Captain America", about: ""))
    }
}
