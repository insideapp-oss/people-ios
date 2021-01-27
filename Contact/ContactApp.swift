//
//  ContactApp.swift
//  Contact
//
//  Created by David Yang on 28/09/2020.
//

import SwiftUI

@main
struct ContactApp: App {
    @StateObject var model = PeopleModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContactView()
            }
            .environmentObject(model)
            .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
                guard let incomingURL = userActivity.webpageURL,
                      let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true),
                      let queryItems = components.queryItems else {
                    return
                }
                if let queryItem = queryItems.first(where: { $0.name == "id"}),
                   let contactId = queryItem.value {
                    model.selectedPeopleId = Int(contactId)
                }
            }
        }
    }
}
