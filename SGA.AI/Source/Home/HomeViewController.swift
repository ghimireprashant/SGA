//
//  HomeViewController.swift
//  SGA.AI
//
//  Created by Prashant Ghimire on 2023-02-20.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var selectedImage: UIImageView!
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }
    @IBAction func getCountAction(_ sender: Any) {
    }
    @IBAction func selectImageAction(_ sender: Any) {
        let imagePickerActionSheet  = UIAlertController(title: "Select Image", message: "", preferredStyle: .actionSheet)
           imagePickerActionSheet.modalPresentationStyle = .overCurrentContext
           imagePickerActionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
               self.openCamera()
           }))
           imagePickerActionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
               self.openGallary()
           }))
           
           imagePickerActionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
           
           let popoverController = imagePickerActionSheet.popoverPresentationController
           
           popoverController?.permittedArrowDirections = .up
           
           
           self.present(imagePickerActionSheet, animated: true, completion: nil)
    }
   private func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    private func openGallary() {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
//        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
