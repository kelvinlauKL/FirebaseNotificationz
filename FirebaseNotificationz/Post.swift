//
//  Post.swift
//  FirebaseNotificationz
//
//  Created by Kelvin Lau on 2016-10-23.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

struct Post {
  var uid: String
  var details: String
  var userId: String
  
  init(uid: String = Server.generateRandomId(), details: String, userId: String) {
    self.uid = uid
    self.details = details
    self.userId = userId
  }
}

extension Post: FirebaseConvertible {
  var json: [String: Any] {
    return [
      "uid": uid,
      "details": details,
      "userId": userId
    ]
  }
  
  init(dictionary: [String: Any]) {
    guard let uid = dictionary["uid"] as? String else { fatalError() }
    self.uid = uid
    
    guard let details = dictionary["details"] as? String else { fatalError() }
    self.details = details
    
    guard let userId = dictionary["userId"] as? String else { fatalError() }
    self.userId = userId
  }
}
