import XCTest
@testable import CountriesOfTheWorld

class CountriesDataSourceTests: XCTestCase {

    func test_hasOneSection() {
        let sut = CountriesDataSource(countries: [])
        
        let tablewView = UITableView()
        tablewView.dataSource = sut
        
        let numberOfSections = tablewView.numberOfSections
        
        XCTAssertEqual(1, numberOfSections)
    }
    
    func test_numberOfRowsAreTheCountriesCount() {
        let countries = [Country(name: "Greece"), Country(name: "United Kingdom"), Country(name: "France"), Country(name: "Spain")]
        let sut = CountriesDataSource(countries: countries)
        
        let tablewView = UITableView()
        tablewView.dataSource = sut
        
        let numberOfRows = tablewView.numberOfRows(inSection: 0)
        
        XCTAssertEqual(countries.count, numberOfRows)
    }
    
    func test_rowShowsCorrectCountry() {
        let countries = [Country(name: "Greece"), Country(name: "United Kingdom"), Country(name: "France"), Country(name: "Spain")]
        let sut = CountriesDataSource(countries: countries)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CountriesListViewCountroller") as! CountriesListViewCountroller
        _ = vc.view
        
        let tablewView = vc.tableView!
        tablewView.dataSource = sut
        tablewView.reloadData()
        
        let cell = tablewView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual("Greece", cell?.textLabel?.text)
        XCTAssertEqual("CountryCell", cell?.reuseIdentifier)
    }
}
