//
//  SwiftUIExampleView.swift
//  Example
//
//  Created by Zheng on 11/6/20.
//

import SwiftUI
import SupportDocs

struct SwiftUIExampleView: View {
    
    let options = SupportOptions(
        urls: .init(
            dataSource: URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!,
            error404: URL(string: "https://google.com")!
        ),
        categories: [
            .init(jsonTagNames: ["recipes"], displayName: "Recipes")
        ],
        navigationBar: .init(
            title: "Support",
            titleColor: UIColor.white,
            dismissButtonTitle: "Done",
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
            footer: AnyView(Footer())
        )
    )
    
    @State var supportDocsPresented = false
    
    var body: some View {
        VStack {
            Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
                .sheet(isPresented: $supportDocsPresented, content: {
                    SupportDocsView(options: options, isPresented: $supportDocsPresented)
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
    
    let options = SupportOptions(
        urls: .init(
            dataSource: URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
        )
    )
    
    @State var supportDocsPresented = false
    
    var body: some View {
        VStack {
            Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
            .sheet(isPresented: $supportDocsPresented, content: {
                SupportDocsView(options: options, isPresented: $supportDocsPresented)
            })
        }
    }
}
