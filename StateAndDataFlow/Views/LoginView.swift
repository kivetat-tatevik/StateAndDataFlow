//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Tatevik Khunoyan on 19.10.2023.
//
//import Foundation
import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var userManager: UserManager
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            UserNameTF(
                name: $userManager.user.name,
                nameIsValid: userManager.nameIsValid)
            
            Button(action: registerUser) {
                Label("ok", systemImage: "checkmark.circle")
            }
            .disabled(!userManager.nameIsValid)
        }
        .padding()
    }
    
    private func registerUser() {
        userManager.user.isLoggedIn.toggle()
        storageManager.save(user: userManager.user)
    }
}

struct UserNameTF: View {
    @Binding var name: String
    var nameIsValid = false
    
    var body: some View {
        ZStack {
            TextField("Type your name", text: $name)
                .multilineTextAlignment(.center)
            HStack {
                Spacer()
                Text(name.count.formatted())
                    .font(.callout)
                    .foregroundColor(nameIsValid ? .green : .red)
                .padding([.top, .trailing])
            }
            
        }
        .padding(.bottom)
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserManager())
    }
}
