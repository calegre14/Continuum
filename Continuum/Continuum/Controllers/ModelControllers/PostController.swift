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
    
    static let shared = PostController()
    var posts: [Post] = []
    
    
    func createPostWith(image: UIImage, caption: String, closure: @escaping (Post?) -> Void) {
        
        let newPost = Post(caption: caption, photo: image)
        posts.append(newPost)
        
    }
    
    func addComment(post: Post, text: String, closure: @escaping (Comment?) -> Void) {
        
    }
    
    
}
