//
//  Product.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import Foundation

struct CatalogProductsResponse: Codable {
   let catalogProducts : [CatalogProduct]

   enum CodingKeys : String, CodingKey { case catalogProducts = "vpProductByIds" }
}

struct CatalogProduct: Identifiable, Codable {
    var id: Int { productId }
    let productId: Int
    let brand: Brand
    let annotation: String
    let masterId: Int
    let url: String
    let orderUnit: String
    let price: Price
    let imageUrl: String
    let name: String
    let productCode: String
    let reviewSummary: ReviewSummary
    let stockAvailability: StockAvailability
}

struct Brand: Codable {
    let id: String
    let name: String
}

struct Price: Codable {
    let value: Int
    let currency: String
    
    var formated: String {
        var tmpCurrency = ""
        switch currency {
        case "CZK":
            tmpCurrency = "Kč"
        case "EURO":
            tmpCurrency = "Eur"
        default:
            return "?"
        }
        return "\(value) \(tmpCurrency)"
    }
}

struct ReviewSummary: Codable {
    let score: Int
    let averageRating: Double
}

struct StockAvailability: Codable {
    let code: String
}

