//
//  UIImage+SystemName.swift
//  ML-Game
//
//  Created by Dmitry Leukhin on 13.10.2022.
//

import UIKit

extension Optional where Wrapped : UIImage {
    var resourceOrEmpty: UIImage {
        guard let image = self else {
            return UIImage()
        }
        return image
    }
}
