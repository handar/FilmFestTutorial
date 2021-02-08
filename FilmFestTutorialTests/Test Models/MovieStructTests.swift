//
//  MovieStructTests.swift
//  FilmFestTutorialTests
//
//  Created by hadia.andar on 1/22/21.
//

//creating movie with title and optional release date
import XCTest
@testable import FilmFestTutorial

class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //movie title test
    func testInit_MovieWithTitle(){ //good practice to be descriptive about what exactly the test function is actually targeting. We are testing initializer of movieStruct, and expecting it to return a movie with a title
        let testMovie = Movie(title: "Generic Blockbuster") //if you do not implement an actual Movie struct, the build will fail, so you need to write the actual implementation code to make this a passing test
        
        //assertion: we are stating explicitly what we want to test
        //assert that our test movie is not nil
        //all assertions start with xctassert
        XCTAssertNotNil(testMovie) //assert that our test movie is NOT nil
        XCTAssertEqual(testMovie.title, "Generic Blockbuster") //check that our movie title is being set when we create a new movie, this assert lets us compare two expressions, and force check that the title of the object testMovie is "Generic Blockbuster", like how we have set it above
        
        //the test passes so our functional code works and correctly sets the movie title
    } 
    
    //check that movies can have title AND optional release date
    func testInit_SetMovieTitleAndRelease(){
        let testMovie = Movie (title: "Romantic Comedy", releaseDate: "1987") //declare a new Movie instance
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Romantic Comedy") //feed XCTASSERTEQUAL our new testMovie title
        XCTAssertEqual(testMovie.releaseDate, "1987") //check if release date is = too, no need to check if the release date is null because release date is optional 
    }

}
