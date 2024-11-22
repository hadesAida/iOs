import UIKit


struct Movie {
    let title: String
    let director: String
    let description: String
    let releaseYear: Int
}

// Step 1: Define the Book struct
struct Book {
    let title: String
    let author: String
    let description: String
}

// Step 2: Create a list of books
let books: [Book] = [
    Book(title: "To Kill a Mockingbird", author: "Harper Lee", description: "A novel set in the 1930s about racism and injustice in a small Southern town."),
    Book(title: "1984", author: "George Orwell", description: "A dystopian novel exploring surveillance, censorship, and totalitarianism."),
    Book(title: "Moby Dick", author: "Herman Melville", description: "The epic tale of Captain Ahab’s obsessive quest to hunt the white whale."),
    Book(title: "Pride and Prejudice", author: "Jane Austen", description: "A classic romantic novel about Elizabeth Bennet and her turbulent relationship with Mr. Darcy."),
    Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", description: "A critique of the American Dream through the lens of wealth and obsession."),
    Book(title: "The Catcher in the Rye", author: "J.D. Salinger", description: "The story of teenage angst and alienation narrated by Holden Caulfield."),
    Book(title: "The Hobbit", author: "J.R.R. Tolkien", description: "A fantasy adventure following Bilbo Baggins on his journey to the Lonely Mountain."),
    Book(title: "Brave New World", author: "Aldous Huxley", description: "A futuristic novel addressing the dangers of a technologically controlled society."),
    Book(title: "Jane Eyre", author: "Charlotte Brontë", description: "A story about love, independence, and morality in 19th-century England."),
    Book(title: "The Alchemist", author: "Paulo Coelho", description: "A philosophical tale about following your dreams and discovering your purpose.")
]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Step 3: Connect the Table View
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Step 4: Set the Table View's delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BookCell")
    }

    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        let book = books[indexPath.row]
        cell.textLabel?.text = book.title
        return cell
    }

    // MARK: - UITableViewDelegate Method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBook = books[indexPath.row]
        let detailVC = BookDetailViewController()
        detailVC.book = selectedBook
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
