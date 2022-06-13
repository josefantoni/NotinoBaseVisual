//
//  MockProducts.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import Foundation

struct MockProducts {
    static var p1 = CatalogProduct(productId: 16073326,
                   brand: Brand(id: "5779", name: "EP Line"),
                   annotation: "sprchový gel a šampon 2 v 1 pro děti 400 ml",
                   masterId: 16073326,
                   url: "/ep-line/paw-patrol-chase-sprchovy-gel-a-sampon-2-v-1-pro-deti/",
                   orderUnit: "ks",
                   price: Price(value: 121, currency: "CZK"),
                   imageUrl: "ep-line/8411114063362_01-o/ep-line-paw-patrol-chase-sprchovy-gel-a-sampon-2-v-1-pro-deti_.jpg",
                   name: "Paw Patrol Chase",
                   productCode: "EPLPWPD_KSWG03",
                   reviewSummary: ReviewSummary(score: 3, averageRating: 2.9),
                   stockAvailability: StockAvailability(code: "moreThan20"))

    static var products: [CatalogProduct] = [
        p1, p1, p1
    ]
}
