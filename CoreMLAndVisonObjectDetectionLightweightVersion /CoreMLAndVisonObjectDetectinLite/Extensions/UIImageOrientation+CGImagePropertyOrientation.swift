//
//  File.swift
//  CoreMLAndVisonObjectDetectinLite
//
//  Created by Ilija Mihajlovic on 4/6/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit
import ImageIO

/*
 Converts a `UIImageOrientation` to a corresponding
 `CGImagePropertyOrientation`. The cases for each
 orientation are represented by different raw values.
 */
extension CGImagePropertyOrientation {
    init(_ orientation: UIImage.Orientation) {
        switch orientation {
        case .up: self = .up
        case .upMirrored: self = .upMirrored
        case .down: self = .down
        case .downMirrored: self = .downMirrored
        case .left: self = .left
        case .leftMirrored: self = .leftMirrored
        case .right: self = .right
        case .rightMirrored: self = .rightMirrored
        default:
        self = .up
        }
    }
}
