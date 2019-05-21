# Core-ML-And-Vision-Object-Classifier-Lightweight-Version

![platform-ios](https://img.shields.io/badge/platform-ios-Blue.svg)
![swift-version](https://img.shields.io/badge/swift-4.2-Orange.svg)
![lisence](https://img.shields.io/badge/license-MIT-Lightgrey.svg)

Core ML and Vision object classifier with a lightweight trained model. The model is trained and tested with Create ML straight from Xcode Playgrounds with the dataset I provided.

When I built my classifier I split the dataset into 80-20 ratio. Approximately 80% of the dataset goes to Training Data and the remaining goes to Testing Data. That way, the classifier has more data to train off of. This whole project is created completely programmatically without Storyboards and Interface Builder.

___

## Side Note
* Currently, I do not have an iPhone, so I'm unable to test the app on a physical device. I apologize in advance for maybe possible bugs.

   Kind regards,

   Ilija 🖖 😄
___

## Requirements
- Physical device! Because the simulator does not have a camera. 
  Or you can use the simulators photo library and classify images from there.
- Swift 4.2
- Xcode 9.2+
- iOS 11.0+
___

## Getting the files

* Use GitHub to clone the repository locally, or download the .zip file of the repository and extract the files.
___

## Example how the UI looks

* This the main screen with the custom toolbar, classification label and camera button.

   ![alt text](https://github.com/IlijaMihajlovic/Core-ML-And-Vision-Object-Classifier-Lightweight-Version/blob/master/Images/startScreen.png)
___

* Here we can see the spinner with the dimmed background, while our model is trying the classify the image we imported from the photo library.

   ![alt text](https://github.com/IlijaMihajlovic/Core-ML-And-Vision-Object-Classifier-Lightweight-Version/blob/master/Images/spinner.png)
   
___   
   
* In this image the model recognizes our fluffy friend mister cat with high accurecy even it never saw this image before or in different words the training and testing dataset we provided the model was without this image.

   On the other side is an image the model was unable to recognize and we get the following message through
our classification label: I need more data!😬🔍.   
This happened because the model was trained only to recognize: dogs🐶, pandas🐼 and cats🐱.

   ![alt text](https://github.com/IlijaMihajlovic/Core-ML-And-Vision-Object-Classifier-Lightweight-Version/blob/master/Images/catAndFlowers.png)
___

* And last we have two images the model recognized likewise with high accuracy.

   ![alt text](https://github.com/IlijaMihajlovic/Core-ML-And-Vision-Object-Classifier-Lightweight-Version/blob/master/Images/pandaAndDog.png)
___

## The Project

* All the code we need to start traing our model are those three lines of code. And that’s it.

    ```swift

   import CreateMLUI
 
   let builder = MLImageClassifierBuilder()
   builder.showInLiveView()

   ```
   
### LiveView
* The next thing is to eneble the Live View feature to see the visual interface!
In the Live View we drop the entire traing foleder into the area and Create ML starts to train our image classifier.

   ![alt text](https://github.com/IlijaMihajlovic/Core-ML-And-Vison-Object-Classifier-Lightweight/blob/master/Images/LiveView.png)

___

### Training Accuracy

* After its done we should see a card with three labels: the Training, Validation, and Evaluation. Training refers to the percentage of training data Xcode was successfully able to train. This should read 100%. 

   ![alt text](https://github.com/IlijaMihajlovic/Core-ML-And-Vison-Object-Classifier-Lightweight/blob/master/Images/model%20accuracy%20after%20testing.png)
   
     While training, Xcode distributes the training data into 80-20. After training 80% of training data, Xcode runs the     classifier on the remaining 20%. This is what Validation refers to: the percentage of training images the classifier was   able to get right. Usually, this can vary because Xcode may not always split the same data.

___

### Testing Result Evaluation

* Lets give the classifier now some tasting data, after the testing finished check the the evaluation result if everything is as expected.
    Voila! We have an AnimalClassifier.mlmodel ready to recognize obviously only three kinds of animals (pandas, cats and dogs) but that's what you get for 37KB of size.

___

### Model Metadata

* After all that is done we can see the inputs our model aspects and the outputs it generates, as well as auto genereted model helper class.

   ![alt text](https://github.com/IlijaMihajlovic/Core-ML-And-Vison-Object-Classifier-Lightweight/blob/master/Images/Model%20Metadata.png)


___
### Camera Usage Description And Photo Library Usage Description  

* At the end I added the "Camera Usage Description" And "Photo Library Usage Description" to info.plist 
so we can access the camera and photo library.

Photo Library Usage Description:
```swift
  <key>NSPhotoLibraryUsageDescription</key>
      <string>Photo Library Needed For Object Detection And Classification</string>
```
Camera Usage Description:
```swift   
   <key>NSCameraUsageDescription</key>
        <string>Camera Needed For Object Detection And Classification</string>
```
___

## License
```
MIT License

Copyright (c) 2019 Ilija Mihajlovic

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```
