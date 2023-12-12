//
//  MuseumAPIApp.swift
//  MuseumAPI
//
//  Created by jose Yun on 11/11/23.
//

import SwiftUI

@main
struct MuseumAPIApp: App {
    @StateObject var pieceSaver = PieceSaver.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pieceSaver)
        }
    }
}
