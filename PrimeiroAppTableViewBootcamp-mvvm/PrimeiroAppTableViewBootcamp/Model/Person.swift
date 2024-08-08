//
//  Person.swift
//  PrimeiroAppTableViewBootcamp
//
//  Created by Caio Fabrini on 24/07/24.
//

import Foundation

struct Person: Equatable {
  var name: String
  var lastName: String
  var age: Int
  var image: String

  static func == (lhs: Person, rhs: Person) -> Bool {
    return lhs.name == rhs.name &&
    lhs.lastName == rhs.lastName &&
    lhs.age == rhs.age &&
    lhs.image == rhs.image
  }
}
