//
//  MovieManagerTests.swift
//  FilmFestTutorialTests
//
//  Created by hadia.andar on 1/27/21.
//

//keeping track of a view variables:
    //number of movies we want to see
    //number of movies we've already been to
import XCTest
@testable import FilmFestTutorial

class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager! //var is a mutable variable, ! is a force unwrapped optional, which means that it should not be nil at all, we don't want the variable to be nil and we want to be initliazed in the set up function, this is just a var named MovieManager

    override func setUpWithError() throws { //testj
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager() //allows us to have a standing instance for the MovieManager() so it allows us to access it for many tests without having to write it out everytime, we make MovieManager var be an instance of MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_MoviesToSeeCount_ReturnsZero(){
        //let sut = MovieManager() //sut = system under test, let is an immutable variable, you can delete this part after you do sut = MovieManager()
        XCTAssertEqual(sut.moviesToSeeCount, 0) //we want moviesToSee to be 0 in the beginning 
    }
    
    func testInit_MoviesSeen_ReturnsZero(){
        //let sut = MovieManager()
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }

}
