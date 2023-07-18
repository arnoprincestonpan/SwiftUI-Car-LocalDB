//
//  SwiftUI_Car_LocalDBApp.swift
//  SwiftUI-Car-LocalDB
//
//  Created by Arno Pan on 2023-07-17.
//

import SwiftUI

@main
struct SwiftUI_Car_LocalDBApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDataManager: CoreDataManager())
        }
    }
}
