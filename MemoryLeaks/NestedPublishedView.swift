//
//  NestedPublishedView.swift
//  MemoryLeaks
//
//  Created by Yuri Goncharov on 27.08.2021.
//

import SwiftUI

struct NestedPublishedView: View {
    @ObservedObject var viewModel: NestedPublishedViewModel
    
    var body: some View {
        VStack {
            NameView(name: $viewModel.selection.name)
            Button("Back", action: viewModel.handleBack)
        }
    }
}

struct NameView: View {
    @Binding var name: String
    
    var body: some View {
        Text("Name is \(name)")
        Button("Change Name") {
            name = "Bob"
        }
        Button("Revert Name") {
            name = "Alice"
        }
    }
}
