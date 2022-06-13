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
    @ObservedObject var viewModel: BoardViewModel

    init() {
        viewModel = BoardViewModel()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
                .onAppear {
                    viewModel.retrieveAllFavouriteProducts()
                    viewModel.fetchData()
            }
        }
    }
}
