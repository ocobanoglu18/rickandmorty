//
//  R_MApp.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 2.11.2022.
//

import SwiftUI

@main
struct R_MApp: App {
    @StateObject var launchViewModel = LaunchViewModel()
    
    var body: some Scene {
        WindowGroup {
//            ContentView().preferredColorScheme(.dark)
            ContentViewGraphQL().preferredColorScheme(.dark).environmentObject(launchViewModel) 
        }
    }
}
