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
    
    //create a few movies here so we can use them throughout the tests and don't have to keep declaring them
    //declaring them as constants and not initializing them using a set up method because we don't need these test movies to be invoked everytime a test runs, like we do in our MovieManager instance.
    let scifiMovie = Movie (title: "Sci-fi")
    let artHouseMovie = Movie (title: "Arthouse Drama")
    let actionMovie = Movie (title: "Action")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager() //allows us to have a standing instance for the MovieManager() so it allows us to access it for many tests without having to write it out everytime, we make MovieManager var be an instance of MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Inital Values
    func testInit_MoviesToSeeCount_ReturnsZero(){
        //let sut = MovieManager() //sut = system under test, let is an immutable variable, you can delete this part after you do sut = MovieManager()
        XCTAssertEqual(sut.moviesToSeeCount, 0) //we want moviesToSee to be 0 in the beginning 
    }
    
    func testInit_MoviesSeen_ReturnsZero(){
        //let sut = MovieManager()
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Add and Query
    func testAdd_MoviesToSee_ReturnsOne(){ //add a movie and make MoviesToSeeCount = 1
        //let testMovie = Movie(title: "Sci-Fi")
        sut.addMovie(movie: scifiMovie) //function to add a new movie to MoviesToSee list
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex(){ //return a movie from any index
        //let testMovie = Movie(title: "Arthouse Drama")
        sut.addMovie(movie: artHouseMovie) //add testMovie to movie list
        
        let movieQueried = sut.movieAtIndex(index: 0) //function will look for an actual index and have it be the movie value for movieQueried
        XCTAssertEqual(artHouseMovie.title, movieQueried.title) //we want the movieQueried to be equal to the testMovie title
        
    }
    
    // MARK: Checking off
    func testCheckOffMovie_UpdatesMovieManagerCounts(){ //tests are getting more complicated, but we are trying our best to make a test handle 1 thing only
        sut.addMovie(movie: actionMovie) //add a movie
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0) //we want moviesToSeeCount to be equal to 0 since it is at 1 right now
        
        XCTAssertEqual(sut.moviesSeenCount, 1) //is 1. Treat each test like it is seperate and does not affect the other
    }
    
    //check if you select or check off a movie, it's removed from the right array
    func testCheckOffMovie_RemovesMovieFromArray(){
        //add few movies to library
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: artHouseMovie)
        
        //check off movie at index 0, which is scifi
        sut.checkOffMovieAtIndex(index: 0)
        
        //assert that when you remove the index 0 scifi movie, the artHouseMovie will be in index 0
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, artHouseMovie.title) //the title of the movie at index 0 is = to the title of artHouseMovie
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex(){
        //need an actual movie at index, so pass in scifi movie
        sut.addMovie(movie: scifiMovie)
        sut.checkOffMovieAtIndex(index: 0) //removes movie at index
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0) //returns the movie you checked off
        XCTAssertEqual(scifiMovie.title, movieQueried.title)
    }

}
