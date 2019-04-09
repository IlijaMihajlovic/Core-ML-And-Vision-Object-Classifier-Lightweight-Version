//
//  Classification.swift
//  CoreMLAndVisonObjectDetectinLite
//
//  Created by Ilija Mihajlovic on 4/9/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit
import Vision
import CoreML

//Classification
extension MainVC {
    
    func updateClassifications(for image: UIImage) {
        showSpinner(onView: captureImageView)
        classificationLabel.text = "Classifying...🧐🔍💻"
        
        let orientation = CGImagePropertyOrientation(image.imageOrientation)
        guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
            do {
                try handler.perform([self.classificationRequest])
                
            } catch {
                print("Failed to perform classification.\n\(error.localizedDescription)")
            }
        }
    }
    
    
    /// Updates the UI with the results of the classification.
    func processClassifications(for request: VNRequest, error: Error?) {
        
        DispatchQueue.main.async {
            guard let results = request.results else {
                self.classificationLabel.text = "Unable to classify image.\n\(error!.localizedDescription)"
                return
            }
            
            let classifications = results as! [VNClassificationObservation]
            
            if classifications.isEmpty {
                self.classificationLabel.text = "Nothing recognized."
                
            }else {
                guard let topClassification = classifications.first else {
                    fatalError("Unexpected results")
                }
                
                if topClassification.confidence <= 0.6 {
                    self.classificationLabel.text = "I need more data!😬🔍"
                    self.removeSpinner()
                } else {
                    
                    // Display top classificaton
                    self.classificationLabel.text = "Classification: " + topClassification.identifier + " - " + String(format: "%.2f", topClassification.confidence * 100) + "%"
                    self.removeSpinner()
                }
            }
        }
    }
}

