import UIKit

class ViewController: UIViewController {
    var moviesLoader: MoviesLoaderType = MoviesLoader() // This has to be injected. In this tutorial we focus only on how to test Result type and closures.

    private(set) var movies : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fetching the data inside the ViewController is not recommended. But in this tutorial we focus only on how to test Result type and closures.
        moviesLoader.fetch {[weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

