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
            TabView {
                PeopleListView(peoples: People.all, selectedPeopleId: nil)
                    .tabItem {
                        VStack {
                            Image(systemName: "person.3")
                            Text("Meet us")
                        }
                    }
                AboutView()
                    .tabItem {
                        VStack {
                            Image(systemName: "questionmark.circle")
                            Text("About")
                        }
                    }
            }
            .tabViewStyle(DefaultTabViewStyle())
            .accentColor(.red)
            .environmentObject(model)
        }
    }
}
