//
//  MovieManager.swift
//  FilmFestTutorial
//
//  Created by hadia.andar on 1/27/21.
//

import Foundation

class MovieManager {
    var moviesToSeeCount: Int {return moviesToSeeArray.count} //let is constant variable, so change the type to var, changing this shows how fluid test driven development can be. Don't overthink the application logic too far ahead of what you need in the present. Your code will be cleaner and less error prone.
    
        //changing it to var of type int and returning the count of moviesToSeeArray to make it better, it is not good to hardcode these variables to be 0
    var moviesSeenCount: Int {return moviesSeenArray.count}
    
    private var moviesToSeeArray = [Movie]() //private array of type Movie
    private var moviesSeenArray = [Movie]() //private array that keeps track of movies checked off or seen
    
    func addMovie(movie: Movie){ //function to take in a movie of type movie to add it to your list
        if !moviesToSeeArray.contains(movie) { //if moviesToSeeArray does NOT contain the movie yet, then add it to the array
            //moviesToSeeCount += 1 //increment the count to 1
            moviesToSeeArray.append(movie) //append that movie you want to add to the array
        }
    }
    
    func movieAtIndex(index: Int) -> Movie { //the function will take in an index and return a Movie which will have a title and optional release date from Movie.swift
        //return Movie(title: "Teen Comedy") //return a default movie
        return moviesToSeeArray[index] //return Movie that was passed in from from our parameter, this will return type Movie
    }
    
    func checkOffMovieAtIndex (index: Int){ //take in parameter index and not return anything
        guard index < moviesToSeeCount else {return} //tell guard what you want to be the case, if it is not, then just return early 
        //moviesToSeeCount -= 1 //decrease count of movies you want to see
        //moviesSeenCount += 1
        
        let checkedMovie = moviesToSeeArray.remove(at: index)
        moviesSeenArray.append(checkedMovie) //append the checked movie to the movies seen array 
        
    }
    
    func checkedOffMovieAtIndex(index: Int) -> Movie {
        return moviesSeenArray [index] //return the movie seen at the index 
    }
    
    func clearArrays(){
        moviesToSeeArray.removeAll()
        moviesSeenArray.removeAll()
    }
}
