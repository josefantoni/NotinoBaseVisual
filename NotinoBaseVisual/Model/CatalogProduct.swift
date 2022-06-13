//
//  Product.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import Foundation

struct CatalogProduct: Decodable {
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

struct Brand: Decodable {
    let id: String
    let name: String
}

struct Price: Decodable {
    let value: Int
    let currency: String
    
    var formated: String {
        var tmpCurrency = ""
        switch currency {
        case ePrice.czk.rawValue:
            tmpCurrency = "Kč"
        case ePrice.euro.rawValue:
            tmpCurrency = "Eur"
        default:
            return "?"
        }
        return "\(value) \(tmpCurrency)"
    }
    
    enum ePrice: String {
        case czk = "CZK",
             euro = "EURO"
    }
}

struct ReviewSummary: Decodable {
    let score: Int
    let averageRating: Double
}

struct StockAvailability: Decodable {
    let code: String
}

