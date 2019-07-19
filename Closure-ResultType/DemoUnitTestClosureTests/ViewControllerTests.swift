import XCTest
@testable import DemoUnitTestClosure

class ViewControllerTests: XCTestCase {

    func test_viewDidLoad_callsFetchOnMoviesFetcher() {
        let sut = ViewController()
        let spyMoviesLoader = SpyMoviesLoader()
        sut.moviesLoader = spyMoviesLoader
        
        _ = sut.view
        
        XCTAssertEqual(1, spyMoviesLoader.numberOfTimesCalledFetch)
    }
    
    
    func test_fetch_success_setsMovies() {
        let sut = ViewController()
        let stubMoviesLoader = StubMoviesLoader()
        let expectedMovies = [Movie(name: "Avengers"), Movie(name: "Star Wars")]
        stubMoviesLoader.stubReturnMovies(movies: expectedMovies)
        sut.moviesLoader = stubMoviesLoader
        
        _ = sut.view
        
        XCTAssertEqual(expectedMovies, sut.movies)
    }
    
    func test_fetch_failure_moviesArrayIsEmpty() {
        let sut = ViewController()
        let stubMoviesLoader = StubMoviesLoader()
        stubMoviesLoader.stubReturnFailureNoInternet()
        sut.moviesLoader = stubMoviesLoader

        _ = sut.view

        XCTAssertEqual([], sut.movies)
    }
}

extension ViewControllerTests {
    
    class SpyMoviesLoader: MoviesLoader {
        
        private(set) var numberOfTimesCalledFetch = 0
        override func fetch(completion: @escaping (Result<[Movie], LoadingError>) -> ()) {
            numberOfTimesCalledFetch += 1
        }
    }
    
    class StubMoviesLoader: MoviesLoader {
        private var movies : [Movie] = []
        private var shouldShowLoadingError: LoadingError?
        
        func stubReturnMovies(movies: [Movie]) {
            self.movies = movies
        }

        func stubReturnFailureNoInternet() {
            self.shouldShowLoadingError = .noInternet
        }
        
        override func fetch(completion: @escaping (Result<[Movie], LoadingError>) -> ()) {
            if let loadingError =  self.shouldShowLoadingError {
                completion(.failure(loadingError))
            } else {
                completion(.success(movies))
            }
        }
    }
}
