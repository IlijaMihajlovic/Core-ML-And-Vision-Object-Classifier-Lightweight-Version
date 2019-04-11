//
//  MainVC.swift
//  CoreMLAndVisionObjectClassifierLightweightVersion
//
//  Created by Ilija Mihajlovic on 4/11/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit
import ImageIO
import CoreML
import Vision


class MainVC: UIViewController{
    
    lazy var cameraButton: UIButton = {
        var button = UIButton()
        
        button.setImage(UIImage(named: "camera")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.layer.zPosition = 3
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(takePicture), for: .touchUpInside)
        
        return button
    }()
    
    private var customToolBar: UIImageView = {
        var cv = UIImageView(image: UIImage(named: "Rectangle"))
        cv.layer.zPosition = 2
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var classificationLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.backgroundColor = .clear
        label.font = UIFont(name: "HelveticaNeue-Light", size: 17)
        label.text = "Let's classify An Image 😄🔍💻"
        label.layer.zPosition = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var presentImageView: UIImageView = {
        var iv = UIImageView()
        iv.backgroundColor = .clear
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var captureImageView: UIImageView = {
        var captureImage = UIImageView()
        captureImage.backgroundColor = .clear
        captureImage.layer.zPosition = 1
        captureImage.translatesAutoresizingMaskIntoConstraints = false
        return captureImage
    }()
    
    
    // MARK: - Image Classification
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            let model = try VNCoreMLModel(for: AnimalClassifier().model)
            
            // Create VN request using Core ML model
            let request = VNCoreMLRequest(model: model) { [weak self] request, error in
                self?.processClassifications(for: request, error: error)
            }
            request.imageCropAndScaleOption = .scaleFit
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        addSubView()
        setupConstraints()
    }
    
    
    @objc fileprivate func takePicture(_ sender: UIButton) {
        //Animate Button
        sender.popUpAnimation()
        // Show options for the source picker only if the camera is available.
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            presentPhotoPicker(sourceType: .photoLibrary)
            return
        }
        
        let photoSourcePicker = UIAlertController()
        let takePhoto = UIAlertAction(title: "Take Photo", style: .default) { [unowned self] _ in
            self.presentPhotoPicker(sourceType: .camera)
        }
        let choosePhoto = UIAlertAction(title: "Choose Photo", style: .default) { [unowned self] _ in
            self.presentPhotoPicker(sourceType: .photoLibrary)
        }
        
        photoSourcePicker.addAction(takePhoto)
        photoSourcePicker.addAction(choosePhoto)
        photoSourcePicker.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(photoSourcePicker, animated: true)
    }
    
    func presentPhotoPicker(sourceType: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = sourceType
        present(picker, animated: true)
    }
    
    
    
    fileprivate func addSubView() {
        [captureImageView, customToolBar, cameraButton, presentImageView, classificationLabel].forEach{(view.addSubview($0))}
    }
    
    //MARK: - Constraints
    fileprivate func setupConstraints() {
        
        //CaptureImageView Constraint
        captureImageView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        //CustomToolBar Constraint
        customToolBar.anchor(top: nil, bottom: captureImageView.bottomAnchor, leading: captureImageView.leadingAnchor, trailing: captureImageView.trailingAnchor, size: .init(width: 0, height: 50))
        
        //CameraButton Constraint
        cameraButton.anchor(top: customToolBar.topAnchor, bottom: customToolBar.bottomAnchor, leading: customToolBar.leadingAnchor, trailing: nil, padding: .init(top: 5, left: 15, bottom: 10, right: 0 ), size: .init(width: 40, height: 40))
        
        //ClassificationLabel Constraint
        classificationLabel.anchor(top: nil, bottom: customToolBar.topAnchor, leading: customToolBar.leadingAnchor, trailing: customToolBar.trailingAnchor,padding: .init(top: 0, left: 10, bottom: 20, right: 0), size: .init(width: 0, height: 50))
        
        //PresentImageView Constraint
        presentImageView.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, size: .init(width: 350, height: 350))
        
        presentImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        presentImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70).isActive = true
        
        
        
    }
    
}

