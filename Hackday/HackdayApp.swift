//
//  HackdayApp.swift
//  Hackday
//
//  Created by Phil Sumpton on 29/10/2021.
//

import SwiftUI

class Deeplink: ObservableObject {
    @Published var isPresented = false
    @Published var url: URL? = nil
}

@main
struct HackdayApp: App {
    private var deeplink = Deeplink()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(deeplink)
                .onOpenURL { url in
                    deeplink.isPresented = true
                    deeplink.url = url
            }
            
        }
    }
}
