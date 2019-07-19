import UIKit

class CountriesListViewCountroller: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource: CountriesDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CountryCell")
        tableView.dataSource = dataSource
    }
}
