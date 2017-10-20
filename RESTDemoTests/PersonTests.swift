//
//  PersonTests.swift
//  RESTDemoTests
//
//  Created by John Cottrell on 10/3/17.
//  Copyright © 2017 John Cottrell. All rights reserved.
//

import XCTest
@testable import RESTDemo

class PersonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonInit() {
        let person = Person()
        
        XCTAssertEqual(person.id, 0, "id should be 0")
        XCTAssertEqual(person.firstName, "", "firstName should be \"\"")
        XCTAssertEqual(person.lastName, "", "lastName should be \"\"")
        XCTAssertEqual(person.favoriteColor, "Blue", "fav color should be blue")
        XCTAssertEqual(person.hometown, "Austin", "hometown should be Austin")
    }
    func testPersonInitWithThreeParams() {
        
        let person = Person(id: 99, firstName: "John", lastName: "Smith")
        
        XCTAssertEqual(person.id, 99, "id should be 99")
        XCTAssertEqual(person.firstName, "John", "firstName should be John")
        XCTAssertEqual(person.lastName, "Smith", "lastName should be Smith")
        XCTAssertEqual(person.favoriteColor, "Blue", "fav color should be blue")
        XCTAssertEqual(person.hometown, "Austin", "hometown should be Austin")
    }
    
    
}
