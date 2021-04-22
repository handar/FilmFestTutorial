//
//  MovieCell.swift
//  FilmFestTutorial
//
//  Created by hadia.andar on 3/16/21.
//

import UIKit

class MovieCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configMovieCell(movie: Movie) {
        self.textLabel?.text = movie.title //the text label is the movie title
        self.detailTextLabel?.text = movie.releaseDate //the detail text label is the movie release date 
    }

}
