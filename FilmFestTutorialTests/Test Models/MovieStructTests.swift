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
    
    // MARK: Initialization
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
    
    // MARK: Equatable
    //directly compare movie instances and their properties
    func testEquatable_ReturnsTrue() {
        //we want to compare two movies with the same title
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    //check if two movies have similiar or dissimilar properties
    func testEquatable_ReturnsNotEqualForDifferentTitles(){
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Adventure")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentReleaseDates(){
        let actionMovie1 = Movie(title: "Action", releaseDate: "1999")
        let actionMovie2 = Movie(title: "Adventure", releaseDate: "2018")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    //check if release dates are not equal
    //these tests basically just say ok test the function in your real code and make sure it does what it is supposed to do
    

}
