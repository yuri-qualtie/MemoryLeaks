//
//  ContentView.swift
//  MemoryLeaks
//
//  Created by Yuri Goncharov on 27.08.2021.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var router: AppRouter
    
    @State var selection = NameModel()
    
    var body: some View {
        switch(router.state) {
        case .selection:
            SelectionView(viewModel: .init())
                .containerAccessibility(identifier: "selection-view")
        case .pickerWithBinding:
            PickerWithBindingView(viewModel: .init())
                .containerAccessibility(identifier: "picker-with-binding-view")
        case .nestedPublished:
            NestedPublishedView(viewModel: .init(selection: selection))
                .containerAccessibility(identifier: "nested-published-view")
        }
    }
}
