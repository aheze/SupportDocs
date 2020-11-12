//
//  SupportDocsWithCategories.swift
//  SupportDocsExamplesSwiftUI
//
//  Created by H. Kamran on 11/11/20.
//

import SwiftUI
import SupportDocs

struct SupportDocsWithCategories: View {
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

    @State var supportDocsPresented: Bool = false
    var body: some View {
        Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
        .sheet(isPresented: $supportDocsPresented, content: {
            SupportDocsView(dataSource: dataSource, options: options)
        })
    }
}
