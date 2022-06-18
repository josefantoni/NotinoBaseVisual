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

struct CatalogProduct: Identifiable, Codable, Equatable {
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
    
    // this is not located in response
    private var _isFavourite: Bool?
    var isFavourite: Bool {
        get { _isFavourite ?? false }
        set { _isFavourite = newValue }
    }
    
    init(productId: Int, brand: Brand, annotation: String, masterId: Int, url: String, orderUnit: String, price: Price, imageUrl: String, name: String, productCode: String, reviewSummary: ReviewSummary, stockAvailability: StockAvailability, _isFavourite: Bool? = nil) {
        self.productId = productId
        self.brand = brand
        self.annotation = annotation
        self.masterId = masterId
        self.url = url
        self.orderUnit = orderUnit
        self.price = price
        self.imageUrl = imageUrl
        self.name = name
        self.productCode = productCode
        self.reviewSummary = reviewSummary
        self.stockAvailability = stockAvailability
        self._isFavourite = _isFavourite
    }

    static func == (lhs: CatalogProduct, rhs: CatalogProduct) -> Bool {
        return lhs.productId == rhs.productId
    }
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

