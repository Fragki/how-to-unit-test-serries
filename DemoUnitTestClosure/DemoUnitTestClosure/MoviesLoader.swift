import Foundation

enum LoadingError: Error {
    case noInternet
}

protocol MoviesLoaderType {
    func fetch(completion: @escaping (Result<[Movie], LoadingError>) -> ())
}

class MoviesLoader: MoviesLoaderType {
    
    func fetch(completion: @escaping (Result<[Movie], LoadingError>) -> ()) {
        
        // Some asynchronous code ......... that fetch movies
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(.success([Movie(name: "Avengers"), Movie(name: "Star Wars")]))
        }
    }
}
