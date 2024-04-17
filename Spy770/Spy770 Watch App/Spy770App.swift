//
//  Spy770App.swift
//  Spy770 Watch App
//
//  Created by Felippo Stedile on 15/04/24.
//

import SwiftUI

@main
struct Spy770_Watch_AppApp: App {
    let vm = SharedConnectivityViewModel()
    var body: some Scene {
        WindowGroup {
            ViewManager()
                .environmentObject(vm)
        }
    }
}
