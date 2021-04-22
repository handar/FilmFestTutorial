//
//  MovieLibraryDataServiceTests.swift
//  FilmFestTutorialTests
//
//  Created by hadia.andar on 3/11/21.
//

/*import XCTest

@testable import FilmFestTutorial
class MovieLibraryDataServiceTests: XCTestCase {

    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    var libraryVC: LibraryViewController!
    
    let fairyTale = Movie(title: "Fairy Tale")
    let thriller = Movie(title: "Thriller")
    let darkComedy = Movie(title: "Dark Comedy")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view //manually trigger our library controller's view did load method. It is important that you trigger the view controller's view before querying or using its properties 
        libraryTableView = libraryVC.libraryTableViewReal
        
        libraryTableView = UITableView()
        libraryTableView.dataSource = sut //datasource = same thing sut is equal to
        libraryTableView.delegate = sut
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //check that our tableview has 2 sections, 1 for movies to see and 1 for movies seen
    //MARK: Sections
    func testTableViewSections_Count_ReturnsTwo(){
        //let dataService = MovieLibraryDataService()
        //let tableView = UITableView()
        
        //tableView.dataSource = dataService //dataSource of the tableView is = to the dataService
        
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2) //# ofsectins must be 2 
    }
    
    //test row section in library table view
    func testTableViewSections_SectionOne_ReturnsMoviesToSeeCount(){
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: darkComedy)
        
        //check the row count, first row should have 2 sections
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
        
        sut.movieManager?.addMovie(movie: thriller)
        libraryTableView.reloadData() //reload the data after adding the tableview
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMoviesSeenCount(){
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: darkComedy)
        
        sut.movieManager?.checkOffMovieAtIndex(index: 0) //check off fairyTale and move it to MoviesSeen
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1) //number of rows in section 1 is 1 after we check off a movie
        
        sut.movieManager?.checkOffMovieAtIndex(index: 0) //check off darkComedy and move it to MoviesSeen
        
        libraryTableView.reloadData()//reload table view
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2) //both of our movies are in the second section
    }
    
    //MARK: Cells
    func testCell_RowAtIndex_ReturnsMovieCell(){
        sut.movieManager?.addMovie(movie: darkComedy) //add a movie
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0)) //first row in first section
        
        XCTAssertTrue(cellQueried is MovieCell) //cellQueried is of type MovieCell
    }
    
    func testCell_ShouldDequeueCell(){
        let mock = TableViewMock()
        mock.dataSource = sut //set mock's datasource to be sut
        mock.register(MovieCell.self, forCellReuseIdentifier: "movieCellID")
        
        sut.movieManager?.addMovie(movie: thriller) //add a movie
        mock.reloadData()
        _ = mock.cellForRow(at:  IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mock.cellDequeuedProperly)
    }
}


//Extend our data service test class to incorporate a mock of a simple TableView
//what do we do with a mock? in this case, we want to check that our taleview cells are being dequeued correctly
extension MovieLibraryDataServiceTests{
    class TableViewMock: UITableView {
        var cellDequeuedProperly = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
}*/

//
//  MovieLibraryDataServiceTests.swift
//  FilmFestTests
//
//  Created by Author on 1/20/18.
//  Copyright © 2018 Author. All rights reserved.
//

import XCTest

@testable import FilmFestTutorial
class MovieLibraryDataServiceTests: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    var libraryVC: LibraryViewController!
    var tableViewMock: TableViewMock!
    
    let fairyTale = Movie(title: "Fairy Tale")
    let thriller = Movie(title: "Thriller")
    let darkComedy = Movie(title: "Dark Comedy")
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        tableViewMock = TableViewMock.initMock(dataSource: sut)
        
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        
        libraryTableView = libraryVC.libraryTableViewReal
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: Sections
    func testTableViewSections_Count_ReturnsTwo() {
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableViewSections_SectionOne_ReturnsMoviesToSeeCount() {
        /*sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: darkComedy)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
        
        sut.movieManager?.addMovie(movie: thriller)
        libraryTableView.reloadData()*/
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 5)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMoviesSeenCount() {
        /*sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: darkComedy)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
        
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        libraryTableView.reloadData()*/
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 0)
    }
    
    // MARK: Cells
    func testCell_RowAtIndex_ReturnsMovieCell() {
        sut.movieManager?.addMovie(movie: darkComedy)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }

    //tested that we can deqeue and configure cells for both table view sections, data source functionality tests 
    func testCell_ShouldDequeueCell() {
        //let mock = TableViewMock()
        //mock.dataSource = sut
        //mock.register(MovieCell.self, forCellReuseIdentifier: "movieCellID")
        
        sut.movieManager?.addMovie(movie: thriller)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
    }
    
    //check that cell data is set properly
    func testCell_SectionOneConfig_ShouldSetCellData(){
        //let mock = TableViewMock()
        //mock.dataSource = sut //datasource is equal to sut
        
        //mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellID")
        
        sut.movieManager?.addMovie(movie: fairyTale) //add a movie
        tableViewMock.reloadData() //reload the data
        
        //in order to assert anything on a cell, we need to pull one out to a local variable
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, fairyTale)
    }
    
    //section 2 configs cells the same way we do section 1
    func testCell_SectionTwoConfig_ShouldSetCellData(){
        sut.movieManager?.addMovie(movie: darkComedy)
        sut.movieManager?.addMovie(movie: fairyTale)
        
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row:0, section: 1)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, darkComedy) //check if the cell's data is equal to dark comedy
        
         }
    
    //check that when we select a cell in section one, it's going to check off that movie and its going to move it to section one, this will fail at first because our data service cannot handle cell selection yet. so go to the movielibrarydataservice.swift file 
    func testCell_Selection_ShouldCheckoffSelectedMovie(){
        //add two movies
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: darkComedy)
        
        //we need to access the library table view's delegate method and access it's table view
        libraryTableView.delegate?.tableView!(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0)) //call the did select row at index path to check off fairyTale
        
        //need four assertions
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1) //movies to see count is equal to 1, since we checked off one of our movies
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1) //movies seen count is 1, since we checked off that we saw fairyTale
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1) //number of rows in section 0 (movies to see) is equal to 1
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1) //number of rows in section 1 (movies seen) is equal to 1
    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectStringValues(){
        let section1Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 0)
        let section2Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies To See")
        XCTAssertEqual(section2Title, "Movies Seen")
    }
}

extension MovieLibraryDataServiceTests {
    
    class TableViewMock: UITableView {
        var cellDequeuedProperly = false
        
        //dependency injection, this is because we kept defininding TableViewMock
        class func initMock(dataSource: MovieLibraryDataService) -> TableViewMock {
            //in order to work with a tableview with more than one section, we need our actual mock to have a default frame
            //the values don't matter for testing purposes
            let mock = TableViewMock(frame: CGRect.init(x: 0, y: 0, width: 300, height: 500), style: .plain)
            
            mock.dataSource = dataSource //datasource we will inject
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellID")
            
            return mock
        }
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    //each mock needs its own distinct implementaion
    class MovieCellMock: MovieCell {
        var movieData: Movie? //test firing our own config method
        
        override func configMovieCell(movie: Movie) {
            movieData = movie
        }
    }
    
}

extension MovieCellTests {
    class MockCellDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}




