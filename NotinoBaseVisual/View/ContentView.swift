//
//  ContentView.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel: BoardViewModel
    
    init(viewModel: BoardViewModel) {
        self.viewModel = viewModel
    }
    var items: [GridItem] = Array(repeating: .init(.flexible(), alignment: .top), count: 2)
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: items) {
                    ForEach(viewModel.products) { product in
                        ProductView(catalogProduct: product,
                                    viewModel: viewModel,
                                    isFavourite: viewModel.isFavourite(product: product))
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Notino")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: BoardViewModel())
    }
}
