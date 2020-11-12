//
//  SwiftUIExampleView.swift
//  Example
//
//  Created by Zheng on 11/6/20.
//

import SwiftUI
import SupportDocs

struct SwiftUIExampleView: View {
    
    let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
    
    let options = SupportOptions(
        categories: [
            .init(tags: ["boba"], displayName: "Boba is awesome!")
        ],
        navigationBar: .init(
            title: "Support",
            titleColor: UIColor.white,
            dismissButtonView: AnyView(Text("Done")),
            buttonTintColor: UIColor.white,
            backgroundColor: UIColor(red: 6 / 255, green: 151 / 255, blue: 0 / 255, alpha: 1)
        ),
        progressBar: .init(
            foregroundColor: UIColor.green,
            backgroundColor: UIColor.systemBackground
        ),
        listStyle: .insetGroupedListStyle,
        other: .init(
            activityIndicatorStyle: UIActivityIndicatorView.Style.large,
            welcomeView: AnyView(WelcomeView()),
            footer: AnyView(Footer()),
            error404: URL(string: "https://google.com")!
        )
    )
    
    @State var supportDocsPresented = false
    
    var body: some View {
        VStack {
            Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
                .sheet(isPresented: $supportDocsPresented, content: {
                    SupportDocsView(dataSourceURL: dataSource, options: options, isPresented: $supportDocsPresented)
                })
            Text("SwiftUIExampleView.swift")
                .foregroundColor(Color(UIColor.secondaryLabel))
        }
    }
}

/**
 The least code that you need to make `SupportDocs` work.
 */
struct SwiftUIExampleView_MinimalCode: View {
    let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
    @State var supportDocsPresented = false
    
    var body: some View {
        Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
        .sheet(isPresented: $supportDocsPresented, content: {
            SupportDocsView(dataSourceURL: dataSource, isPresented: $supportDocsPresented)
        })
    }
}

struct SwiftUIExampleView_WithCategories: View {
    let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
    
    let options = SupportOptions(
        categories: [
            .init(
                tags: ["boba"],
                displayName: "Display Name Is Boba",
                displayColor: UIColor.blue
            ),
            .init(
                tags: ["fastFood"],
                displayName: "These aren't really healthy",
                displayColor: UIColor.red
            )
        ]
    )
    
    @State var supportDocsPresented = false
    
    var body: some View {
        Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
        .sheet(isPresented: $supportDocsPresented, content: {
            SupportDocsView(dataSourceURL: dataSource, options: options)
        })
    }
}

