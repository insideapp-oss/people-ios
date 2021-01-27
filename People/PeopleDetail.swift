//
//  PeopleDetail.swift
//  People
//
//  Created by David Yang on 28/09/2020.
//

import SwiftUI

struct PeopleDetail: View {
    var people: People
    @State private var showingAlert = false

    var body: some View {
        List {
            Section {
                Text("Role: \(people.role)")
                Text(people.about)
            }
            Section {
                Button("Contact \(people.firstname)") {
                    self.showingAlert = true
                }.alert(isPresented: $showingAlert, content: {
                    Alert(title: Text("inside|app"), message: Text("Thanks! We'll let \(people.firstname) know you tried to reach him"))
                })
                people.twitter.map {
                    Link("Twitter", destination: URL(string: "https://www.twitter.com/\($0)")!)
                }
                Link("Website", destination: URL(string: "https://www.insideapp.fr/")!)
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(people.displayName)
    }
}

struct PeopleDetail_Previews: PreviewProvider {
    static var previews: some View {
        PeopleDetail(people: People.all[0])
    }
}
