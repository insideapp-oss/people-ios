//
//  ContentView.swift
//  People
//
//  Created by David Yang on 28/09/2020.
//

import SwiftUI

struct PeopleListView: View {
    var peoples: [People]

    @State var selectedPeopleId: String?
    @EnvironmentObject private var model: PeopleModel

    var body: some View {
        NavigationView {
            Form {
                List(peoples) { people in
                    NavigationLink(destination: PeopleDetail(people: people), tag: "\(people.id)", selection: $selectedPeopleId) {
                        PeopleRow(people: people)
                    }
                    .onReceive(model.$selectedPeopleId, perform: { newValue in
                        guard let peopleId = newValue else { return }
                        selectedPeopleId = "\(peopleId)"
                    })
                }
            }
            .navigationBarTitle("Meet inside|app")
        }
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView(peoples: People.all)
    }
}
