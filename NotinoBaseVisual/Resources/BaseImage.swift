//
//  BaseImage.swift
//  NotinoBaseVisual
//
//  Created by Josef Antoni on 09.06.2022.
//

import SwiftUI

enum BaseImage: String {
    case heartEmpty,
         heartFull,
         starEmpty,
         starFull
}

extension Image {
    init(baseImage: BaseImage) {
        self.init(uiImage: UIImage(named: baseImage.rawValue) ?? UIImage())
    }
}
