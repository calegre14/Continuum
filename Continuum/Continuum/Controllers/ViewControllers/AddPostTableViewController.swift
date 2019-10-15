//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Christopher Alegre on 10/15/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    
    var selectedImage: UIImage?
    
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var captionTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        captionTextField.text = nil
    }

    @IBAction func selectImageButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func addPostButtonTapped(_ sender: UIButton) {
        guard let image = selectedImage,
            let caption = captionTextField.text, !caption.isEmpty else {return}
        PostController.shared.createPostWith(image: image, caption: caption) { (_) in
        }
        self.tabBarController?.selectedIndex = 0
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelBarButtonTapped(_ sender: UIBarButtonItem) {
        self.tabBarController?.selectedIndex = 0
    }
}
