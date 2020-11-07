//
//  SwiftUIExampleView.swift
//  Example
//
//  Created by Zheng on 11/6/20.
//

import SwiftUI
import SupportDocs

struct SwiftUIExampleView: View {
    
    @State var supportDocsPresented = false
    let options = SupportOptions(
        urls: .init(
            dataSource: <#T##URL#>,
            error404: <#T##URL#>
        ),
        categories: nil,
        navigationBar: .init(
            title: <#T##String#>,
            titleColor: <#T##UIColor#>,
            dismissButtonTitle: <#T##String?#>,
            buttonTintColor: <#T##UIColor?#>,
            backgroundColor: <#T##UIColor?#>,
            backgroundImage: <#T##UIImage?#>
        ),
        progressBar: .init(
            foregroundColor: <#T##UIColor#>,
            backgroundColor: <#T##UIColor#>
        ),
        listStyle: .defaultListStyle,
        other: .init(
            activityIndicatorStyle: <#T##UIActivityIndicatorView.Style#>,
            footer: <#T##AnyView?#>
        )
    )
    
    var body: some View {
        Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
        .sheet(isPresented: $supportDocsPresented, content: {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Sheet Content")/*@END_MENU_TOKEN@*/
        })
    }
}
