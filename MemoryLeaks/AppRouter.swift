//
//  AppRouter.swift
//  MemoryLeaks
//
//  Created by Yuri Goncharov on 27.08.2021.
//

import Foundation
import SwiftUI

class AppRouter: ObservableObject {
    static let shared = AppRouter()
    
    @Published var state: AppState = .selection
    
    func route(to state: AppState) {
        withAnimation(.linear(duration: 0.5)) {
            self.state = state
        }
    }
}
