//
//  MovieLibraryDataService.swift
//  FilmFestTutorial
//
//  Created by hadia.andar on 3/10/21.
//

import UIKit

//"class" that represents a group of constants unchangeable variables
//easier to test than having hard coded values
//0 indexed like our tables
//going to have raw values to keep track of sections
enum LibrarySection: Int{
    case MoviesToSee, MoviesSeen
}

//service is going to exist in the storyboard as its own object attached to this class
//LibraryViewController is going to have a reference to this class and use it to assign the data source and delegate when the view loads
//keeps everything nice and decoupled, which will make testing easier down the road

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    var movieManager: MovieManager? //set to an optional value
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager = movieManager else {
            return 0 //if our movieManager variable is nil, we are going to return number of rows in section 0
        }
        
        guard let librarySection = LibrarySection(rawValue: section) else { //check that we have a valid section with enum
            fatalError()
        }
        
        switch librarySection {
        case .MoviesToSee:
            return movieManager.moviesToSeeCount //return this for the value
        case .MoviesSeen:
            return movieManager.moviesSeenCount
        }
        
        //return movieManager.moviesToSeeCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieManager = movieManager else {fatalError()} //check if movie manager is present
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else {fatalError()} //want librarySectin to fail with a fatal error if it is not found
        
        
        //return MovieCell() //return a blank ui table view cell (MovieCell instance) instead of actually calling the table view dequeue reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: indexPath) as! MovieCell
        
        //determine which movies from the movies arrays will be returned
        //pull movies to see array :  //pull from movies seen
        let movieData = librarySection.rawValue == 0 ? movieManager.movieAtIndex(index: indexPath.row) : movieManager.checkedOffMovieAtIndex(index: indexPath.row)
       
        cell.configMovieCell(movie: movieData)
        
        return cell 
    }
    

    //# of sections method
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager = movieManager else {fatalError()} //movieManager must = moviemanager
        guard let librarySection = LibrarySection(rawValue: indexPath.section) //librarySection must equal librarySection indexPath.section else fatal error
        else {fatalError()}
        
        //selecting movies is only possible if choosing from section 1
        if librarySection == .MoviesToSee { //if librarySection is from section 1
            movieManager.checkOffMovieAtIndex(index: indexPath.row)
            tableView.reloadData() 
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //check that we have a valid library section
        guard let librarySection = LibrarySection(rawValue: section)
        else {fatalError()}
        
        let sectionTitle = librarySection.rawValue == 0 ? "Movies To See" : "Movies Seen"
        
        return sectionTitle
    }
    
}
