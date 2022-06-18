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
    var imageUrl: URL

    var body: some View {
        VStack {
            AsyncImage(url: imageUrl) { imagePhase in
                switch imagePhase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    let width = UIScreen.main.bounds.width/2 // only 2 items are visible on screen
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: width, height: width, alignment: .top)
                default:
                    Image(systemName: "questionmark")
                }
            }
        }
    }
}
