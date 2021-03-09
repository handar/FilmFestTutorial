//
//  LibraryViewContollerTests.swift
//  FilmFestTutorialTests
//
//  Created by hadia.andar on 3/8/21.
//

import XCTest
@testable import FilmFestTutorial

class LibraryViewContollerTests: XCTestCase {
    
    //declare system under test variable to help use test class better
    //sut = system under variable, what we are testing
    var sut: LibraryViewController! //we are testing the library view controller
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //sut = LibraryViewController() //sut is a new instance of library view controller, setting to a blank instance of LibraryViewController, not pulling from the actual view controller we set up in ui
        
        //set sut to test the actual view controller with the id we assigned the library view controller
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewControllerID") as! LibraryViewController
        
        //in order for a library view controller to be tsted, it's view did load method has to be manually triggered in any of our tests
        _ = sut.view
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //check that we actually have a table view on our library view controller
   //MARK: Nil Checks
    func testLibaryVC_TableViewShouldNotBeNil(){
        //assert that tableview is not nil
        XCTAssertNotNil(sut.libraryTableView)
    }
    
    //MARK: Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource(){
        //assert that data source is not nil
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        
        //assert that data source is of type MovieLibraryDataService, which is going to be our decoupled class
        XCTAssertTrue(sut.libraryTableView)
    }

}
