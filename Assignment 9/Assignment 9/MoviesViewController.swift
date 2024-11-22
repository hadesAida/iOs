import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView! 

    let movies: [Movie] = [
        Movie(title: "Inception", director: "Christopher Nolan", description: "A mind-bending thriller where dreams are a battleground.", releaseYear: 2010),
        Movie(title: "The Godfather", director: "Francis Ford Coppola", description: "The iconic story of a powerful mafia family.", releaseYear: 1972),
        Movie(title: "The Dark Knight", director: "Christopher Nolan", description: "A gripping tale of Batman's fight against the Joker.", releaseYear: 2008),
        Movie(title: "Forrest Gump", director: "Robert Zemeckis", description: "The inspiring story of a man's extraordinary journey through life.", releaseYear: 1994),
        Movie(title: "The Shawshank Redemption", director: "Frank Darabont", description: "A tale of hope and friendship set in a prison.", releaseYear: 1994)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MovieCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        let movie = movies[indexPath.row]
        cell.textLabel?.text = "\(movie.title) (\(movie.releaseYear))"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        let detailVC = MovieDetailViewController()
        detailVC.movie = selectedMovie
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
