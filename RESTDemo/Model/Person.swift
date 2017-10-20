//
//  Person.swift
//  RESTDemo
//
//  Created by John Cottrell on 8/20/17.
//  Copyright © 2017 John Cottrell. All rights reserved.
//

import Foundation

struct Person {
    var id: Int
    var firstName: String
    var lastName: String
    var hometown: String = "Austin"
    var favoriteColor: String = "Blue"
    
    init() {
        self.id = 0
        self.firstName = ""
        self.lastName = ""
    }
    
    init(id: Int, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
}
