//
//  NotinoBaseVisualApp.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import SwiftUI
import Combine

@main
struct NotinoBaseVisualApp: App {
    @StateObject var viewModel: BoardViewModel = BoardViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
