//
//  RowView.swift
//  NotinoBaseVisual
//
//  Created by Pepča on 13.06.2022.
//

import SwiftUI

struct RowView: View {
    private let productsInRow: [CatalogProduct]
    private var viewModel: BoardViewModel
    private let width: CGFloat
    private let height: CGFloat
    private let horizontalSpacing: CGFloat
    
    init(productsInRow: [CatalogProduct],
         viewModel: BoardViewModel,
         width: CGFloat,
         height: CGFloat,
         horizontalSpacing: CGFloat) {
        self.productsInRow = productsInRow
        self.viewModel = viewModel
        self.width = width
        self.height = height
        self.horizontalSpacing = horizontalSpacing
    }
    
    var body: some View {
        HStack(spacing: horizontalSpacing) {
            ForEach(productsInRow, id: \.productId) { p in
                let isFavourite = viewModel.isFavourite(product: p)
                let action: () -> Void = { viewModel.markFavourite(product: p)
                    viewModel.favouriteProductsbyId.shuffle()
                }
                ProductView(catalogProduct: p,
                            width: width,
                            isFavourite: isFavourite,
                            favouriteAction: action)
                .frame(width: width,
                       height: height)
            }
        }
        .padding()
    }
}
