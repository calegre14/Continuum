//
//  PostListTableViewController.swift
//  Continuum
//
//  Created by Christopher Alegre on 10/15/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {
    
    var resultsArray: [Post] = []
    var isSearching: Bool = false
    var dataSource: [SearchRecord] {
        return isSearching ? resultsArray : PostController.shared.posts
    }
    
    @IBOutlet weak var postSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postSearchBar.delegate = self
        tableView.rowHeight = 400
        tableView.estimatedRowHeight = 400
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.resultsArray = PostController.shared.posts
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postListCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        let post = dataSource[indexPath.row] as? Post
        cell.post = post
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostDetailTVC" {
            guard let indexPathTapped = tableView.indexPathForSelectedRow,
                let destinationTVC = segue.destination as? PostDetailTableViewController else {return}
            let postBeingSent = PostController.shared.posts[indexPathTapped.row]
            destinationTVC.post = postBeingSent
        }
    }
}

extension PostListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let filter = PostController.shared.posts.filter{ $0.matches(searchTerm: searchText) }
        resultsArray = filter
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resultsArray = PostController.shared.posts
        tableView.reloadData()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }
}

