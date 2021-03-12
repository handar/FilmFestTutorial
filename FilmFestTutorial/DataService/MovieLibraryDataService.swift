//
//  MovieLibraryDataService.swift
//  FilmFestTutorial
//
//  Created by hadia.andar on 3/10/21.
//

import UIKit

//service is going to exist in the storyboard as its own object attached to this class
//LibraryViewController is going to have a reference to this class and use it to assign the data source and delegate when the view loads
//keeps everything nice and decoupled, which will make testing easier down the road

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell() //return a blank ui table view cell
    }
    

}
