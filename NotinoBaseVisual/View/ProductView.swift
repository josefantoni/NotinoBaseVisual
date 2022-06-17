//
//  ProductView.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import SwiftUI

struct ProductView: View {
    private let catalogProduct: CatalogProduct
    @ObservedObject private var viewModel: BoardViewModel
    @State private var isFavourite: Bool
    
    init(catalogProduct: CatalogProduct,
         viewModel: BoardViewModel,
         isFavourite: Bool) {
        self.catalogProduct = catalogProduct
        self.viewModel = viewModel
        self.isFavourite = isFavourite
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 5) {
                if let url = URL(string: Strings.productImagePrefixUrl+catalogProduct.imageUrl) {
                    ImageView(url: url,
                              placeHolder: Image(systemName: "note"))
                }
                Text(catalogProduct.brand.name)
                    .font(.system(size: 15))
                    .fontWeight(.light)
                Text(catalogProduct.name)
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Text(catalogProduct.annotation)
                    .font(.system(size: 12))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 5)
                Text(catalogProduct.price.formated)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                RatingView(catalogProduct: catalogProduct)
                    .padding(.bottom, 12)
                
                Button(action: {
                    // TODO: add to cart
                }, label: {
                    Text("DO KOŠÍKU") // localization in future version?
                        .font(.system(size: 11))
                        .fontWeight(.light)
                        .padding(10)
                        .frame(height: 25)
                })
                .buttonStyle(PlainButtonStyle())
                .border(.black, width: 0.6)
            }
            
            VStack (alignment: .trailing){
                HStack (alignment: .top){
                    Spacer()
                    Button(action: {
                        viewModel.markFavourite(product: catalogProduct)
                    }, label: {
                        Image(baseImage: isFavourite ? .heartFull : .heartEmpty)
                            .frame(width: 40,
                                   height: 40)
                    })
                }
                Spacer()
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        // adjust width value if working with Mock
        ProductView(catalogProduct: MockProducts.p1,
                    viewModel: BoardViewModel(),
                    isFavourite: false)
    }
}
