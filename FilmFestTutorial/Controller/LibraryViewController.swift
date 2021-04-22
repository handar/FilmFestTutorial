//
//  ViewController.swift
//  FilmFestTutorial
//
//  Created by hadia.andar on 1/22/21.
//

import UIKit

class LibraryViewController: UIViewController {

    
    @IBOutlet weak var libraryTableViewReal: UITableView! //libraryTableViewReal is of type UITableView
    @IBOutlet var dataService: MovieLibraryDataService! //dataService is of type MovieLibraryDataService
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.libraryTableViewReal.dataSource = dataService //the UITableView's datasource is of type MovieLibraryDataService
        self.libraryTableViewReal.delegate = dataService //the UITableView's delegate is of type MovieLibraryDataService
        
        dataService.movieManager = movieManager
        
        //dummy data
        dataService.movieManager?.addMovie(movie: Movie(title: "Action", releaseDate: "1999"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Horror", releaseDate: "1989"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Crime Thriller", releaseDate: "1979"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Indie Comedy"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Kung Fu Flick"))
        
        libraryTableViewReal.reloadData()
    }


}

