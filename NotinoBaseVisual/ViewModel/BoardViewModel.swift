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
}

struct CatalogProductsResponse: Decodable {
   let catalogProducts : [CatalogProduct]

   enum CodingKeys : String, CodingKey { case catalogProducts = "vpProductByIds" }
}
