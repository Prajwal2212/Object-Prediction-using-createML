//
//  ViewController.swift
//  Seefood
//
//  Created by Prajwal Prasad on 11/07/24.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) 
    {
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            imageView.image = userPickedImage
            
            guard let imageCI = CIImage(image: userPickedImage) else
            {
                fatalError("Couldn't convert to CI Image.")
            }
            
            detect(image: imageCI)
        }
        imagePicker.dismiss(animated: true, completion: nil)
        messageLabel.isHidden = true
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) 
    {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func detect(image: CIImage)
    {
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else
        {
            fatalError("Loading CoreML Failed!")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else
            {
                fatalError("Model failed to process image.")
            }
            
            if let firstResult = results.first
            {
                self.navigationItem.title = firstResult.identifier
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do
        {
            try handler.perform([request])
        }
        catch
        {
            print(error)
        }
    }
    
}
