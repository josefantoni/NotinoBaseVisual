//
//  ProductView.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import SwiftUI

struct ProductView: View {
    private let catalogProduct: CatalogProduct
    private let width: CGFloat
    @State private var isFavourite: Bool = false
    private var favouriteAction: () -> Void
    
    init(catalogProduct: CatalogProduct,
         width: CGFloat,
         isFavourite: Bool,
         favouriteAction: @escaping () -> Void) {
        self.catalogProduct = catalogProduct
        self.width = width
        self.isFavourite = isFavourite
        self.favouriteAction = favouriteAction
    }
    
    var body: some View {
        VStack {
            ZStack {
                VStack(alignment: .center, spacing: 5) {
                    productImageView
                        .padding(.top, 15)
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
                    Text(catalogProduct.price.formated)
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                    RatingView(catalogProduct: catalogProduct)
                        .padding(.bottom, 12)

                    Button(action: {
                        // TODO: add to cart
                    }, label: {
                        Text(Strings.addToCart) // localization in future version?
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
                            favouriteAction()
                            isFavourite.toggle()
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
    
    var productImageView: some View {
        AsyncImage(url: URL(string: Strings.productImagePrefixUrl+catalogProduct.imageUrl)) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: width,
                       maxHeight: width)
        } placeholder: {
            // Todo: placeholder or progressbar?
            Color.clear
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        // adjust width value if working with Mock
        ProductView(catalogProduct: MockProducts.p1,
                    width: 200,
                    isFavourite: false,
                    favouriteAction: {})
    }
}
