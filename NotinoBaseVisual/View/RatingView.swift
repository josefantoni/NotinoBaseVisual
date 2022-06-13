//
//  RatingView.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import SwiftUI

struct RatingView: View {
    private let catalogProduct: CatalogProduct
    
    init(catalogProduct: CatalogProduct) {
        self.catalogProduct = catalogProduct
    }
    
    var body: some View {
        HStack(spacing: 0) {
            let score = catalogProduct.reviewSummary.score
            if score == 0 {
                // According to provided image, 0 reviews received -> ratings are hidden
                EmptyView()
            } else {
                ForEach(1...5, id: \.self) {
                    if score >= $0 {
                        Image(baseImage: .starFull)
                    } else {
                        Image(baseImage: .starEmpty)
                    }
                }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(catalogProduct: MockProducts.p1)
    }
}
