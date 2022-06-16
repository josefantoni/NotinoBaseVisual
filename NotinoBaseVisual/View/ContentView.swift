//
//  ContentView.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import SwiftUI

struct ContentView: View {
    private let itemPerRow: CGFloat = 2
    private let horizontalSpacing: CGFloat = 16
    private let height: CGFloat = 300
    @ObservedObject private var viewModel: BoardViewModel
    
    init(viewModel: BoardViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        // Use geometry to calculate width of the products based on itemPerRow
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    Divider()
                    // Iterate products and fillup in the VStack
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(0..<viewModel.products.count, id: \.self) { i in
                            // Process the first index of each row
                            if i % Int(itemPerRow) == 0 {
                                // Get view
                                buildView(rowIndex: i, geometry: geometry)
                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(Strings.appTitle)
            }
        }
    }
    // Iterate data and see if got more index
    func buildView(rowIndex: Int, geometry: GeometryProxy) -> RowView? {
        var rowProducts = [CatalogProduct]()
        for itemIndex in 0..<Int(itemPerRow) {
            // Check if got two item in counts, then insert it properly
            if rowIndex + itemIndex < viewModel.products.count {
                rowProducts.append(viewModel.products[rowIndex + itemIndex])
            }
        }
        if !rowProducts.isEmpty {
            return RowView(productsInRow: rowProducts,
                           viewModel: viewModel,
                           width: getWidth(geometry: geometry),
                           height: height,
                           horizontalSpacing: horizontalSpacing)
        }
        
        return nil
    }
    
    func getWidth(geometry: GeometryProxy) -> CGFloat {
        let width: CGFloat = (geometry.size.width - horizontalSpacing * (itemPerRow + 1)) / itemPerRow
        return width
    }
}
