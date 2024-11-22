import UIKit

class MovieDetailViewController: UIViewController {

    // A property to hold the movie data passed from the previous view controller
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    // Function to set up the user interface with labels displaying movie details
    private func setupUI() {
        guard let movie = movie else { return }

        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = movie.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // Director Label
        let directorLabel = UILabel()
        directorLabel.text = "Director: \(movie.director)"
        directorLabel.translatesAutoresizingMaskIntoConstraints = false

        // Description Label
        let descriptionLabel = UILabel()
        descriptionLabel.text = movie.description
        descriptionLabel.numberOfLines = 0  // Allow multiple lines for long descriptions
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        // Release Year Label
        let releaseYearLabel = UILabel()
        releaseYearLabel.text = "Release Year: \(movie.releaseYear)"
        releaseYearLabel.translatesAutoresizingMaskIntoConstraints = false

        // Add Subviews
        view.addSubview(titleLabel)
        view.addSubview(directorLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(releaseYearLabel)

        // Layout Constraints (position the labels on the screen)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            directorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            directorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            releaseYearLabel.topAnchor.constraint(equalTo: directorLabel.bottomAnchor, constant: 10),
            releaseYearLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: releaseYearLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
