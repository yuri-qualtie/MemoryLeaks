//
//  NestedPublishedViewModel.swift
//  MemoryLeaks
//
//  Created by Yuri Goncharov on 27.08.2021.
//

import Foundation

class NestedPublishedViewModel: ObservableObject {
    @Published var selection: SelectionModel
    
    init(selection: SelectionModel) {
        self.selection = selection
    }
    
    func handleBack() {
        AppRouter.shared.state = .selection
    }
}