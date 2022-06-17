//
//  AsyncWebImageView.swift
//  NotinoBaseVisual
//
//  Created by Pepča on 17.06.2022.
//

import Foundation
import Combine
import UIKit
import SwiftUI

struct ImageView: View {
    private var url: URL
    private var placeHolder: Image
    @ObservedObject var binder = ImageBinder()
    
    init(url: URL, placeHolder: Image) {
        self.url = url
        self.placeHolder = placeHolder
        self.binder.load(url: self.url)
        
    }
    var body: some View {
        VStack {
            if let image = binder.image {
                let width = UIScreen.main.bounds.width/2 // only 2 items are visible on screen
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: width, alignment: .top)
            } else {
                placeHolder
            }
        }
        .onDisappear { self.binder.cancel() }
    }
}

class ImageBinder: ObservableObject {
    private var bag: AnyCancellable?
    
    @Published private(set) var image: UIImage?
    
    func load(url: URL) {
        bag = URLSession.shared
            .dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    func cancel() {
        bag?.cancel()
    }
}
