//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Tatevik Khunoyan on 19.10.2023.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @StateObject private var userManager = UserManager(
        user: StorageManager.shared.fetchUser()
    )
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(userManager)
        }
    }
}
