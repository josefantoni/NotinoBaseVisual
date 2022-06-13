//
//  BoardViewModel.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import Foundation
import Alamofire
import Combine

class BoardViewModel: ObservableObject {
    @Published var products: [CatalogProduct] = []
    @Published var favouriteProductsbyId: [Int] = []

    func fetchData() {
        AF.request(Strings.productsUrl).responseDecodable(of: CatalogProductsResponse.self) { response in
            if case let .success(data) = response.result {
                self.products = data.catalogProducts
            } else {
                // TODO: handle error
                print(response.description)
            }
        }
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
