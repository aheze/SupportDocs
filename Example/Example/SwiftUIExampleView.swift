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
            .init(tag: "boba", displayName: "Boba is awesome!")
        ],
        navigationBar: .init(
            title: "Support",
            titleColor: UIColor.white,
            dismissButtonTitle: "Done",
            buttonTintColor: UIColor.white,
            backgroundColor: UIColor(red: 6 / 255, green: 151 / 255, blue: 0 / 255, alpha: 1)
        ),
        searchBar: .init(
            placeholder: "Type here to search",
            placeholderColor: UIColor.white.withAlphaComponent(0.75),
            textColor: UIColor.white,
            tintColor: UIColor.green,
            backgroundColor: UIColor.white.withAlphaComponent(0.3),
            clearButtonMode: .whileEditing
        ),
        progressBar: .init(
            foregroundColor: UIColor.green,
            backgroundColor: UIColor.systemBackground
        ),
        listStyle: .insetGroupedListStyle,
        navigationViewStyle: .defaultNavigationViewStyle,
        other: .init(
            activityIndicatorStyle: UIActivityIndicatorView.Style.large,
            welcomeView: AnyView(WelcomeView()),
            footer: AnyView(Footer()),
            error404: URL(string: "https://aheze.github.io/SupportDocs/404")!
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
struct SwiftUIExampleViewMinimalCode: View {
    let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
    @State var supportDocsPresented = false
    
    var body: some View {
        Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
        .sheet(isPresented: $supportDocsPresented, content: {
            SupportDocsView(dataSourceURL: dataSource, isPresented: $supportDocsPresented)
        })
    }
}

struct SwiftUIExampleViewWithCategories: View {
    let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
    
    let options = SupportOptions(
        categories: [
            .init(
                tag: "boba",
                displayName: "Display Name Is Boba",
                displayColor: UIColor.blue
            ),
            .init(
                tag: "fastFood",
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

