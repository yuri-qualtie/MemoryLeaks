//
//  PickerWithBindingView.swift
//  MemoryLeaks
//
//  Created by Yuri Goncharov on 27.08.2021.
//

import SwiftUI

struct PickerWithBindingView: View {
    @ObservedObject var viewModel: PickerWithBindingViewModel
    
    var body: some View {
        HStack {
            Picker(selection: $viewModel.selectedItem, label: EmptyView()) {
                ForEach(viewModel.items) {
                    Text($0.title)
                        .tag($0)
                }
            }
            .padding()
        }
        Text("Selected: \(viewModel.selectedItem.title)")
        Button("Back", action: viewModel.handleBack)
    }
}
