//
//  NanoChallengeMichelleApp.swift
//  NanoChallengeMichelle
//
//  Created by Michelle Alexandra on 13/05/22.
//

import SwiftUI

@main
struct NanoChallengeMichelleApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var reportListViewModel = ReportListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(reportListViewModel)
        }
    }
}
