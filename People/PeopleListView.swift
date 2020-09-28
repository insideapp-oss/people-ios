//
//  ContentView.swift
//  People
//
//  Created by David Yang on 28/09/2020.
//

import SwiftUI

struct PeopleListView: View {
    var body: some View {
        NavigationView {
            List(peopleData) { people in
                NavigationLink(destination: PeopleDetail(people: people)) {
                    PeopleRow(people: people)
                }
            }
            .navigationBarTitle("Meet inside|app")
        }
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView()
    }
}
