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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.libraryTableViewReal.dataSource = dataService //the UITableView's datasource is of type MovieLibraryDataService
        self.libraryTableViewReal.delegate = dataService //the UITableView's delegate is of type MovieLibraryDataService 
    }


}

