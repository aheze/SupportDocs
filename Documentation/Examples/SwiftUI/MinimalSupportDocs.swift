//
//  MinimalSupportDocs.swift
//  SupportDocsExamplesSwiftUI
//
//  Created by H. Kamran on 11/11/20.
//

import SwiftUI
import SupportDocs

struct MinimalSupportDocs: View {
    let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!

    @State var supportDocsPresented: Bool = false
    var body: some View {
        Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
        .sheet(isPresented: $supportDocsPresented, content: {
            SupportDocsView(dataSource: dataSource, isPresented: $supportDocsPresented)
        })
    }
}
