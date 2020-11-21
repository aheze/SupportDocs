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
            .init(
                tags: ["boba", "fastFood"],
                displayName: "Food that tastes great",
                displayColor: UIColor.orange
            )
        ]
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

