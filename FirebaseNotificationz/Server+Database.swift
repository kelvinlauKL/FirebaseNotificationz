//
//  Server+Database.swift
//  FirebaseNotificationz
//
//  Created by Kelvin Lau on 2016-10-23.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//


import Firebase

protocol FirebaseConvertible {
  var json: [String: Any] { get }
  
  init(dictionary: [String: Any])
}

extension Server {
  private static var rootRef: FIRDatabaseReference {
    return FIRDatabase.database().reference()
  }
  
  private static var usersRef: FIRDatabaseReference {
    return Server.rootRef.child("users")
  }
  
  private static var postsRef: FIRDatabaseReference {
    return Server.rootRef.child("posts")
  }
  
  static func generateRandomId() -> String {
    return Server.rootRef.childByAutoId().key
  }
  
  static func loadUser(withIdentifier identifier: String, completion: @escaping (User?) -> ()) {
    Server.usersRef.child(identifier).observeSingleEvent(of: .value, with: { snapshot in
      guard let userDict = snapshot.value as? [String: Any] else { return completion(nil) }
      let user = User(dictionary: userDict)
      
      DispatchQueue.main.async {
        completion(user)
      }
    })
  }
  
  static func loadPost(withIdentifier identifier: String, completion: @escaping (Post?) -> ()) {
    Server.postsRef.child(identifier).observeSingleEvent(of: .value, with: { snapshot in
      guard let postDict = snapshot.value as? [String: Any] else { return completion(nil) }
      let post = Post(dictionary: postDict)
      
      DispatchQueue.main.async {
        completion(post)
      }
    })
  }
  
  static func save(user: User) {
    Server.usersRef.child(user.uid).setValue(user.json)
  }
  
  static func save(post: Post) {
    Server.postsRef.child(post.uid).setValue(post.json)
  }
}
