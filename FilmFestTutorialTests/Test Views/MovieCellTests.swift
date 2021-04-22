//
//  MovieCellTests.swift
//  FilmFestTutorialTests
//
//  Created by hadia.andar on 3/19/21.
//

import XCTest
@testable import FilmFestTutorial

class MovieCellTests: XCTestCase {
    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource! //we need a mock data source for ouro tableview 

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //libraryVC is of type LibraryViewController
        let libraryVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        //call libraryVC's view method so that our view did load actually triggers
        _ = libraryVC.view
        
        tableView = libraryVC.libraryTableViewReal
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
   func testCell_Config_ShouldSetLabelsToMovieData() {
        //pull out a cell
       let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: IndexPath(row: 0, section: 0)) as! MovieCell
        
        //after we have our cell, call cell config method too add a movie
        cell.configMovieCell(movie: Movie(title: "Indie Comedy", releaseDate: "2018"))
        
        XCTAssertEqual(cell.textLabel?.text, "Indie Comedy")
        XCTAssertEqual(cell.detailTextLabel?.text, "2018")
    }

}
