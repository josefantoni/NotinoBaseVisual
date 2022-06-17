//
//  BoardViewModel.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import Foundation
import Combine

class BoardViewModel: ObservableObject {
    @Published var products: [CatalogProduct] = []
    @Published var favouriteProductsbyId: [Int] = []

    func fetchData() {
        
    }
    
    func markFavourite(product: CatalogProduct) {
        favouriteProductsbyId = PersistentStore.markFavourite(product: product)
    }
    
    func retrieveAllFavouriteProducts() {
        if let favIds = PersistentStore.retrieveAllFavouriteProducts() {
            favouriteProductsbyId = favIds
        }
    }
    
    func isFavourite(product: CatalogProduct) -> Bool {
        return PersistentStore.retrieveFavouriteIndex(from: favouriteProductsbyId,
                                                      productById: product.productId) != nil
    }
}

struct CatalogProductsResponse: Decodable {
   let catalogProducts : [CatalogProduct]

   enum CodingKeys : String, CodingKey { case catalogProducts = "vpProductByIds" }
}
