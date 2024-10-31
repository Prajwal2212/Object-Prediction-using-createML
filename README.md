# Object Recognition App Using CreateML and Swift - README
## 1. Goal
The goal of this project is to build a machine learning (ML) app using CreateML in Swift that predicts the object captured by the device’s camera. The app leverages a custom-trained ML model to recognize and classify objects in real time through the camera feed, providing users with instant predictions based on what the model has learned.

## Installation
Clone the repository using git:
```bash
git clone https://github.com/Prajwal2212/Object-Prediction-using-createML.git
cd Object-Prediction-using-createML
```

## 2. Process
### 2.1. Tools and Frameworks
#### CreateML: Apple's tool used to create and train the custom ML model for object recognition.
#### CoreML: Framework used to integrate the trained model into the Swift app for real-time predictions.
#### Vision: Framework that handles image analysis and feeds the processed data to the CoreML model.
#### Swift: Programming language used to develop the iOS app.
### 2.2. Steps
#### Data Collection and Preparation:

Collect images of various objects to be recognized by the model. The dataset should include a diverse range of labeled images for each category (e.g., "Apple," "Book," "Laptop").\
Organize the images into labeled folders corresponding to each object class.
#### Model Training with CreateML:

Use CreateML to build and train the image classification model. Import the dataset and label the classes accordingly.\
Split the data into training and testing sets to evaluate the model's performance.\
Train the model, adjusting parameters like training iterations and augmentations to improve accuracy.\
Once trained, export the model as a .mlmodel file.
#### Integrating the Model into the Swift App:

Add the trained .mlmodel file to the Xcode project.\
Use CoreML to load the model and Vision to handle image analysis in real-time from the camera feed.\
#### Implementing Real-Time Object Recognition:

Capture the live camera feed using AVFoundation.\
Use Vision to perform image analysis on each frame and pass the results to the CoreML model for prediction.\
The app outputs the most likely object class along with its confidence level, updating the UI with the predicted label.\
#### Displaying Predictions:

The app overlays the prediction label on the camera view, updating dynamically as the camera detects different objects.\
Additional UI elements can be included to display the confidence percentage or a list of top predictions.\
#### Testing and Refinement:

Test the app in various environments to ensure it recognizes objects accurately under different lighting conditions and angles.\
If needed, refine the model by adding more training data or retraining with improved parameters.
### 2.3. Code Structure
#### ViewController.swift: Contains the main logic for capturing camera frames, processing images with Vision, and making predictions with CoreML.
#### Model Integration: The .mlmodel file is included in the project and referenced in the code to load and use for predictions.
#### Main.storyboard: Handles the app’s user interface, including the camera preview and prediction labels.
## 3. Result
The final object recognition app successfully predicts the object captured by the device’s camera in real time. By integrating a custom-trained ML model with CoreML and Vision, the app provides accurate predictions directly on the device, allowing users to identify various objects seamlessly.

### Key Features:
Real-time object detection and prediction using a custom-trained ML model.\
Intuitive interface with dynamic updates based on camera feed analysis.\
High accuracy with custom-trained data, allowing for recognition of specific object categories.\
This project highlights the power of machine learning combined with AR and computer vision, showcasing how CreateML can be used to create custom models that deliver real-time object recognition in a mobile application.
