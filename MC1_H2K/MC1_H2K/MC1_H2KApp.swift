//
//  MC1_H2KApp.swift
//  MC1_H2K
//
//  Created by Dwianditya Hanif Raharjanto on 29/04/23.
//

import SwiftUI

@main
struct MC1_H2KApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                                             persistenceController.container.viewContext)
        }
    }
}
