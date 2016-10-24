//
//  PostsViewController.swift
//  FirebaseNotificationz
//
//  Created by Kelvin Lau on 2016-10-23.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit

final class PostsViewController: UIViewController {
  @IBOutlet private var tableView: UITableView!
  
  fileprivate var posts: [Post] = []
}

// MARK: - UITableViewDataSource
extension PostsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseIdentifier) as? PostCell else { fatalError() }
    cell.post = posts[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
}

// MARK: - @IBActions
private extension PostsViewController {
  @IBAction func addButtonTapped() {
    let alertController = UIAlertController(title: "Add Post", message: nil, preferredStyle: .alert)
    
    alertController.addTextField { textField in
      textField.placeholder = "Details"
    }
    
    let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
      guard let detailText = alertController.textFields?[0].text else { fatalError() }
      let post = Post(details: detailText, userId: Server.currentUserId!)
      Server.save(post: post)
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
    alertController.addAction(okAction)
    alertController.addAction(cancelAction)
    
    present(alertController, animated: true, completion: nil)
  }
}
