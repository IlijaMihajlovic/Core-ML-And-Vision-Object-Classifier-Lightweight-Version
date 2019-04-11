//
//  PopUppAnimationButtonExt.swift
//  CoreMLAndVisionObjectClassifierLightweightVersion
//
//  Created by Ilija Mihajlovic on 4/11/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit

extension UIButton {
    
    func popUpAnimation() {
        self.transform = self.transform.scaledBy(x: 0.001, y: 0.001)
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)}, completion: nil)
    }
}
