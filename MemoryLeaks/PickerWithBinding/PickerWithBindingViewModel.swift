//
//  PickerWithBindingViewModel.swift
//  MemoryLeaks
//
//  Created by Yuri Goncharov on 27.08.2021.
//

import Foundation

class PickerWithBindingViewModel: ObservableObject {
    let items = Item.all
    
    @Published var selectedItem: Item = Item.all.first!
    
    func handleBack() {
        AppRouter.shared.route(to: .selection)
    }
}
