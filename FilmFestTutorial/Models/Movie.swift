//
//  Movie.swift
//  FilmFestTutorial
//
//  Created by hadia.andar on 1/22/21.
//

import Foundation

//create an empty struct
//bare minimum code to make our tests pass
//functional code for func testInit_MovieWithTitle()
struct Movie: Equatable {
    let title: String
    let releaseDate: String? //string optional (?) since not all movies have a release date
    
    //we want a default value in our release date and a custom initializer
    //when you create a new instance of a struct it creates an initiliazer for u 
    init(title: String, releaseDate: String? = nil){ //this way you can use both init without release date and with release date 
        self.title = title
        self.releaseDate = releaseDate
    }
}

//create this for the func testEquatable_ReturnsTrue() and the func testEquatable_ReturnsNotEqualForDifferentTitles()
func==(lhs: Movie, rhs: Movie) -> Bool {
    //return true if you return just true, any equatable function will just return true
    
    if lhs.title != rhs.title {
        return false
    }
    
    if lhs.releaseDate != rhs.releaseDate {
        return false
    }
    return true 
}


