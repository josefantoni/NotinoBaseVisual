//
//  PersistentStore.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import Foundation

class PersistentStore {
    static func markFavourite(product: CatalogProduct) {
        var allFavouriteProducts = retrieveAllFavouriteProducts()
        if let productIndex = allFavouriteProducts.firstIndex(where: { $0 == product.productId }) {
            allFavouriteProducts.remove(at: productIndex)
        } else {
            allFavouriteProducts.append(product.productId)
        }
        UserDefaults.standard.set(allFavouriteProducts, forKey: Strings.favourite)
    }
     
    static func retrieveAllFavouriteProducts() -> [Int] {
        if let allFavourites = UserDefaults.standard.object(forKey: Strings.favourite) as? [Int] {
            return allFavourites
        }
        return []
    }
}
