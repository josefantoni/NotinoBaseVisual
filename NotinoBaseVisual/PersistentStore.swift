//
//  PersistentStore.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import Foundation

class PersistentStore: ObservableObject {
    static func markFavourite(product: CatalogProduct) -> [Int] {
        if var allFavouriteProducts = retrieveAllFavouriteProducts() {
            if let productIndex = retrieveFavouriteIndex(from: allFavouriteProducts,
                                                         productById: product.productId) {
                allFavouriteProducts.remove(at: productIndex)
            } else {
                allFavouriteProducts.append(product.productId)
            }
            UserDefaults.standard.set(allFavouriteProducts, forKey: Strings.favourite)
            return allFavouriteProducts
        } else {
            UserDefaults.standard.set([product.productId], forKey: Strings.favourite)
            return [product.productId]
        }
    }
    
    static func retrieveFavouriteIndex(from favouriteProducts: [Int],
                                       productById: Int) -> Int? {
        if let product = favouriteProducts.firstIndex(where: { $0 == productById }) {
           return product
        }
        return nil
    }
 
    static func retrieveAllFavouriteProducts() -> [Int]? {
        if let allFavourites = UserDefaults.standard.object(forKey: Strings.favourite) as? [Int] {
            return allFavourites
        }
        return nil
    }
}
