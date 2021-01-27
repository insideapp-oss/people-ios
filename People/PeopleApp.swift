//
//  PeopleApp.swift
//  People
//
//  Created by David Yang on 28/09/2020.
//

import SwiftUI

@main
struct PeopleApp: App {
    @StateObject var model = PeopleModel()

    var body: some Scene {
        WindowGroup {
            PeopleListView(peoples: People.all, selectedPeopleId: nil)
                .environmentObject(model)
        }
    }
}
