//
//  AboutView.swift
//  People
//
//  Created by David Yang on 28/01/2021.
//

import SwiftUI

struct AboutView: View {
    var accentColors = ["blue", "red", "green", "orange", "purple"]

    @EnvironmentObject private var model: PeopleModel
    @State var selectedAccentColor: Int = 1

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("This is a demo app for testing purposes.")
                }
                Section(header: Text("Version")) {
                    ItemRow(title: "Marketing version", value: Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String)
                    ItemRow(title: "Build number", value: Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String)
                }
                Section(footer: Text("© Copyright 2021 - inside|app")) { EmptyView() }
            }
            .navigationTitle("About")
        }
    }
}

struct ItemRow: View {
    var title: String
    var value: String

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
                .foregroundColor(.accentColor)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
