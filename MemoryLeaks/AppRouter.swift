//
//  AppRouter.swift
//  MemoryLeaks
//
//  Created by Yuri Goncharov on 27.08.2021.
//

import Foundation

class AppRouter: ObservableObject {
    static let shared = AppRouter()
    
    @Published var state: AppState = .selection
}
