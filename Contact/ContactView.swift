//
//  ContactView.swift
//  Contact
//
//  Created by David Yang on 27/01/2021.
//

import SwiftUI

struct ContactView: View {

    @State var people: People?
    @EnvironmentObject var model: PeopleModel

    var body: some View {
        HStack {
            if let people = people {
                PeopleDetail(people: people)
            } else {
                VStack {
                    Image(systemName: "questionmark.circle").font(.largeTitle)
                        .padding(16)
                    Text("Sorry, no matching content found")
                }
            }
        }
        .onReceive(model.$selectedPeopleId, perform: { newValue in
            guard let peopleId = newValue, let selectedPeople = People.all.first(where: { $0.id == peopleId }) else {
                return
            }
            people = selectedPeople
        })
    }
}
