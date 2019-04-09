//
//  File.swift
//  CoreMLAndVisonObjectDetectinLite
//
//  Created by Ilija Mihajlovic on 4/6/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit

class ScaledHeightImageView: UIImageView {
    
    override var intrinsicContentSize: CGSize {
        
        if let myImage = self.image {
            let myImageWidth = myImage.size.width
            let myImageHeight = myImage.size.height
            let myViewWidth = self.frame.size.width
            
            let ratio = myViewWidth/myImageWidth
            let scaledHeight = myImageHeight * ratio
            
            return CGSize(width: myViewWidth, height: scaledHeight)
        }
        
        return CGSize(width: -1.0, height: -1.0)
    }
    
}
