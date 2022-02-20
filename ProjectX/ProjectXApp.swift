//
//  ProjectXApp.swift
//  ProjectX
//
//  Created by Kacper Kalicki on 19/02/2022.
//

import SwiftUI

@main
struct ProjectXApp: App {
    @StateObject var ViewModel = ModelData()
    @StateObject var HistoryViewModel = HistoryData()

    var body: some Scene {
        WindowGroup{
            ContentView()
                .environmentObject(ViewModel)
                .environmentObject(HistoryViewModel)
        }
          
        
    }
}
