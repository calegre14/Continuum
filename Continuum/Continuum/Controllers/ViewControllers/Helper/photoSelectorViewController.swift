//
//  photoSelectorViewController.swift
//  Continuum
//
//  Created by Christopher Alegre on 10/16/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

protocol PhotoSelectorViewControllerDelegate: class {
    func photoSelectorViewControllerSelected(image: UIImage)
}

class photoSelectorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var delegate: PhotoSelectorViewControllerDelegate?
    
    @IBOutlet weak var postPhotoImageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let photo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            postPhotoImageview.image = photo
            delegate?.photoSelectorViewControllerSelected(image: photo)
        }
    }
    
    @IBAction func postPotoImageButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let alertController = UIAlertController(title: "Select Image", message: nil, preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                self.present(imagePicker, animated: true, completion: nil)
            }))
        }
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (_) in
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }))
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alertController, animated: true)
    }
}
