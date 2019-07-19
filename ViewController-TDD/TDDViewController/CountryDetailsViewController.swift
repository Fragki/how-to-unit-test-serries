import UIKit

class CountryDetailsViewController: UIViewController {
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryFlagLabel: UILabel!
    
    var country: Country = Country(name: "Greece", code: "gr")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryNameLabel.text = country.name
        countryFlagLabel.text = country.flag()
    }
}
