//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Christopher Alegre on 10/15/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController, PhotoSelectorViewControllerDelegate {
    
    //MARK:- Outlets
    @IBOutlet weak var captionTextField: UITextField!
    
    var selectedImage: UIImage?
    
    //MARK:-Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        captionTextField.text = ""
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        captionTextField.text = ""
    }
    
    func photoSelectorViewControllerSelected(image: UIImage) {
        selectedImage = image
    }
    
    //MARK:- Actions
    @IBAction func addPostButtonTapped(_ sender: UIButton) {
        guard let image = selectedImage,
            let caption = captionTextField.text, !caption.isEmpty else {return}
        PostController.shared.createPostWith(image: image, caption: caption) { (_) in
        }
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func cancelBarButtonTapped(_ sender: UIBarButtonItem) {
        self.tabBarController?.selectedIndex = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhotoSelectorVC" {
            let photoSelector = segue.destination as? photoSelectorViewController
            photoSelector?.delegate = self
        }
    }
}
