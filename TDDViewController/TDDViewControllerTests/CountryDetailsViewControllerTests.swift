import XCTest
@testable import TDDViewController

class CountryDetailsViewControllerTests: XCTestCase {

    func test_shouldShowCountryName() {
        let sut = createSUT()
        
        _ = sut.view
        
        XCTAssertEqual("Greece", sut.countryNameLabel.text)
    }
    
    func test_shouldShowFlag() {
        let sut = createSUT()
        
        _ = sut.view
        
        let expectedFlag = try? CountryCodeStringToFlagConvert.flag(country: "gr")
        XCTAssertEqual(expectedFlag, sut.countryFlagLabel.text)
    }
    
    func createSUT() -> CountryDetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "CountryDetailsViewController") as! CountryDetailsViewController
        
    }
}
