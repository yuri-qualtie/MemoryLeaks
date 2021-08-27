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
        case .pickerWithBinding:
            PickerWithBindingView(viewModel: .init())
        case .nestedPublished:
            NestedPublishedView(viewModel: .init(selection: selection))
        }
    }
}
