//
//  ViewController.swift
//  FoodTracker
//
//  Created by yusaku ikeda on 2019/09/16.
//  Copyright © 2019 yusaku ikeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.delegate = self
    }

    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: ¥(info)")
        }
        
        photoImageView.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
}

