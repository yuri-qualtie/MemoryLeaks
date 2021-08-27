//
//  MemoryLeaksApp.swift
//  MemoryLeaks
//
//  Created by Yuri Goncharov on 27.08.2021.
//

import SwiftUI

@main
struct MemoryLeaksApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(router: AppRouter.shared)
                .frame(width: 200, height: 200)
        }
    }
}
