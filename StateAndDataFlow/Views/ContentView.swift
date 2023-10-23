//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Tatevik Khunoyan on 19.10.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var userManager: UserManager
    
    @StateObject private var timer = TimeCounter()
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            Text("Hi \(userManager.user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)

            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            
            Spacer()
            
            VStack {
                Spacer()
                
                ButtonView(title: timer.buttonTitle, color: .red) {
                    timer.startTimer()
                }
                
                Spacer()
                
                ButtonView(title: "LogOut", color: .blue){
                    storageManager.clear(userManager: userManager)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
            
    }
}
