//
//  TastethewasteApp.swift
//  Tastethewaste
//
//  Created by Caylie Taylor on 2/27/21.
//

import SwiftUI

@main
struct TastethewasteApp: App {
    
    let persistenceContainer = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
