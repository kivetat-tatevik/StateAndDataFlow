//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Tatevik Khunoyan on 19.10.2023.
//

import Foundation

final class UserManager: ObservableObject {
    
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    init(user: User = User()) {
        self.user = user
    }
}
