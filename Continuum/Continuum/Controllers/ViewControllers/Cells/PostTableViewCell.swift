//
//  PostTableViewCell.swift
//  Continuum
//
//  Created by Christopher Alegre on 10/15/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var postPhotoImageView: UIImageView!
    @IBOutlet weak var postCaptionLabel: UILabel!
    @IBOutlet weak var postCommentCountLabel: UILabel!
    
    
    func updateViews() {
        guard let post = post else {return}
        postPhotoImageView.image = post.photo
        postCaptionLabel.text = post.caption
        postCommentCountLabel.text = "\(post.comments.count)"
    }

}
