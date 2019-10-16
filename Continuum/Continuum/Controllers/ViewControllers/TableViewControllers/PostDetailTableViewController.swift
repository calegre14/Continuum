//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by Christopher Alegre on 10/15/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    var post: Post? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    //MARK:- Properties
    @IBOutlet weak var photoImageView: UIImageView!
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func commentButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Comment", message: "Write your Comment", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Comment Here"
            textField.autocorrectionType = .yes
            textField.autocapitalizationType = .sentences
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okayAction = UIAlertAction(title: "Okay", style: .default) { (_) in
            guard let comment = alert.textFields?.first?.text, !comment.isEmpty,
                let post = self.post else {return}
            PostController.shared.addComment(post: post, text: comment) { (comment) in
            }
            self.tableView.reloadData()
        }
        alert.addAction(cancelAction)
        alert.addAction(okayAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        guard let captions = post?.caption else { return }
        let shareSheet = UIActivityViewController(activityItems: [captions], applicationActivities: nil)
        present(shareSheet, animated: true, completion: nil)
    }
    @IBAction func followPostButtonTapped(_ sender: UIButton) {
    }
    
    
    func updateViews() {
        photoImageView.image = post?.photo
        tableView.reloadData()
        }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comments.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postDetailCell", for: indexPath)
        let comment = post?.comments[indexPath.row]
        cell.textLabel?.text = comment?.text
        cell.detailTextLabel?.text = comment?.timestamp.formatDate()
        return cell
    }
}
