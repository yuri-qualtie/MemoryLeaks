//
//  SelectionView.swift
//  MemoryLeaks
//
//  Created by Yuri Goncharov on 27.08.2021.
//

import SwiftUI

struct SelectionView: View {
    let viewModel: SelectionViewModel
    
    var body: some View {
        VStack {
            Button("Picker with Binding", action: viewModel.handlePickerWithBinding)
        }
    }
}
