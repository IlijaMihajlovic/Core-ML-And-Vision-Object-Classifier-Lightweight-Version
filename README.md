# Core-ML-And-Vison-Object-Classifier-Lightweight

![platform-ios](https://img.shields.io/badge/platform-ios-Blue.svg)
![swift-version](https://img.shields.io/badge/swift-4.2-Orange.svg)
![lisence](https://img.shields.io/badge/license-MIT-Lightgrey.svg)

Core ML and Vison object Classifier With An Lightweight Trained Model.
The model is trained and tested with Create ML straight from Xcode Playgrounds with the dataset I provided.
Core ML and Vision object Classifier With An Lightweight Trained Model. The model is trained and tested with Create ML straight from Xcode Playgrounds with the dataset I provided.

When I built my classifier I split the dataset into 80-20 ratio. Approximately 80% of the dataset goes to Training Data and the remaining goes to Testing Data. That way, the classifier has more data to train off of. This whole project is created completely programmatically without Storyboards and Interface Builder.

___

## Side Note
* Currently, I do not have an iPhone, so I'm unable to test the app on a physical device. I apologize in advance for maybe possible bugs.

   Kind regards,

   Ilija 🖖 😄
___

## Requirements
- Physical device! Because the simulator does not have a camera. 
  Or you can use the simulators photo library and classify images from there
- Swift 4.2
- Xcode 9.2+
- iOS 11.0+
___

## Example how the UI looks


In progress... 
___

## The Project

* All the code we need to start traing our model are those three lines of code. And that’s it

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

While training, Xcode distributes the training data into 80-20. After training 80% of training data, Xcode runs the     classifier on the remaining 20%. This is what Validation refers to: the percentage of training images the classifier was   able to get right. Usually, this can vary because Xcode may not always split the same data

![alt text](https://github.com/IlijaMihajlovic/Core-ML-And-Vison-Object-Classifier-Lightweight/blob/master/Images/model%20accuracy%20after%20testing.png)

___

### Testing Result Evaluation

* Lets give the classifier now some tasting data and see the evaluation result

![alt text](https://github.com/IlijaMihajlovic/Core-ML-And-Vison-Object-Classifier-Lightweight/blob/master/Images/Testing%20result%20evaluation.png)

And Voila! We have a AnimalClassifier.mlmodel ready to recognize obviously only three kinds of animals (pandas, cats and dogs) but that's what you get for 37KB of size.

___

### Model Metadata

* After all that is done we can see the inputs our model aspects and the outputs it generates, as well as auto genereted model helper class.

![alt text](https://github.com/IlijaMihajlovic/Core-ML-And-Vison-Object-Classifier-Lightweight/blob/master/Images/Model%20Metadata.png)


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
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```
