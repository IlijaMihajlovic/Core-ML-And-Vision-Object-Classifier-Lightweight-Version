//
//  File.swift
//  CoreMLAndVisonObjectDetectinLite
//
//  Created by Ilija Mihajlovic on 4/6/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit

// MARK: - Handling Image Picker Selection

extension MainVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { fatalError("No image returned") }
        presentImageView.contentMode = UIView.ContentMode.scaleAspectFit
        presentImageView.image = image
        updateClassifications(for: image)

    }
}
