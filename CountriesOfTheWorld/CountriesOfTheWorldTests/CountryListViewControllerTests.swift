import XCTest
@testable import CountriesOfTheWorld

class CountriesListViewControllerTests: XCTestCase {

    func test_setsTableView() {
        let countriesListViewCountroller = createSUT()
        
        _ = countriesListViewCountroller.view
        
        XCTAssertNotNil(countriesListViewCountroller.tableView)
    }

    func test_setsDataSource() {
        let countriesListViewCountroller = createSUT()
        
        let countriesDataSource = CountriesDataSource(countries: [])
        countriesListViewCountroller.dataSource = countriesDataSource
        _ = countriesListViewCountroller.view
        
        XCTAssertTrue(countriesListViewCountroller.tableView.dataSource === countriesDataSource)
    }
    
    private func createSUT() -> CountriesListViewCountroller {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "CountriesListViewCountroller") as! CountriesListViewCountroller
    }
}

