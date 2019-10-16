//
//  PostController.swift
//  Continuum
//
//  Created by Christopher Alegre on 10/15/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit
import CloudKit

class PostController {
    
    //MARK:- Singelton
    static let shared = PostController()
    //MARK:- SoT
    var posts: [Post] = []
    
    //MARK:- CRUD
    func createPostWith(image: UIImage, caption: String, closure: @escaping (Post?) -> Void) {
        let newPost = Post(caption: caption, photo: image)
        posts.append(newPost)
    }
    
    func addComment(post: Post, text: String, closure: @escaping (Comment?) -> Void) {
        let newComment = Comment(text: text, post: post)
        post.comments.append(newComment)
    }
}
