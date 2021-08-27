//
//  SelectionViewModel.swift
//  MemoryLeaks
//
//  Created by Yuri Goncharov on 27.08.2021.
//

import Foundation

class SelectionViewModel: ObservableObject {
    func handlePickerWithBinding() {
        AppRouter.shared.state = .pickerWithBinding
    }
    func handleNestedPublished() {
        AppRouter.shared.state = .nestedPublished
    }
}
