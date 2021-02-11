//
//  MovieManager.swift
//  FilmFestTutorial
//
//  Created by hadia.andar on 1/27/21.
//

import Foundation

class MovieManager {
    var moviesToSeeCount = 0 //let is constant variable, so change the type to var, changing this shows how fluid test driven development can be. Don't overthink the applicatin logic too far ahead of what you need in the present. Your code will be cleaner and less error prone.
    var moviesSeenCount = 0
    
    private var moviesToSeeArray = [Movie]() //private array of type Movie
    
    func addMovie(movie: Movie){ //function to take in a movie of type movie to add it to your list
        moviesToSeeCount += 1 //increment the count to 1
        moviesToSeeArray.append(movie) //append that movie you want to add to the array
    }
    
    func movieAtIndex(index: Int) -> Movie { //the function will take in an index and return a Movie which will have a title and optional release date from Movie.swift
        //return Movie(title: "Teen Comedy") //return a default movie
        return moviesToSeeArray[index] //return index that was passed in from from our parameter, this will return type Movie
    }
    
    func checkOffMovieAtIndex (index: Int){ //take in parameter index and not return anything
        guard index < moviesToSeeCount else {return} //tell guard what you want to be the case, if it is not, then just return early 
        moviesToSeeCount -= 1 //decrease count of movies you want to see
        moviesSeenCount += 1
        
    }
}
