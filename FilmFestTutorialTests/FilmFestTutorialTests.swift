//
//  FilmFestTutorialTests.swift
//  FilmFestTutorialTests
//
//  Created by hadia.andar on 1/22/21.
//

import XCTest //framework import, gives us access to the functionality we need to write our tests
@testable import FilmFestTutorial //really important, going to let our test classes communicate with our actual application code

class FilmFestTutorialTests: XCTestCase {
    
    //going to run before each test method in the class is executed
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    //put any cleanup code that needs to be run after every test is executed
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //function examples that shows the skelaton of what a test and performance method looks like, all test method names need to start with "test"
    //delete these when creating an actual test 
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
