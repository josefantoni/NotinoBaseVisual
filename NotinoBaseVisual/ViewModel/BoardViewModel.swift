//
//  BoardViewModel.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import Foundation
import Combine

class BoardViewModel: ObservableObject {
    private var bag = Set<AnyCancellable>()

    @Published var products: [CatalogProduct] = []

    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let targetUrl = URL(string: Strings.productsUrl) else {
            print("Error not a valid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: targetUrl)
            .receive(on: DispatchQueue.main)
            .tryMap(handleReceivedOutput)
            .decode(type: CatalogProductsResponse.self, decoder: JSONDecoder())
            // IF for any reason this failed. For presentation i am giving here a mock data -> replaceEmpty
            .replaceEmpty(with: CatalogProductsResponse(catalogProducts: MockProducts.products))
            .sink { (completion) in
                switch completion {
                case .finished:
                    print("New catalog was downloaded!")
                case .failure(let error):
                    print("Error occured while downloading a new catalog: \(error)")
                }
            } receiveValue: { [weak self] receivedProducts in
                guard let self = self else { return }
                let allFavourite = PersistentStore.retrieveAllFavouriteProducts()
                self.products = receivedProducts.catalogProducts.map({ catalogProduct -> CatalogProduct in
                    var p = catalogProduct
                    p.isFavourite = allFavourite.contains(where: { $0 == p.productId })
                    return p
                })
            }
            .store(in: &bag)
    }
    
    private func handleReceivedOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
                throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    func markFavourite(product: CatalogProduct) {
        PersistentStore.markFavourite(product: product)
    }
}
