import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var powerstatsLabel: UILabel!
    @IBOutlet weak var appearanceLabel: UILabel!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var connectionsLabel: UILabel!
    @IBOutlet weak var randomizeButton: UIButton!
    

    var superheroes: [Superhero] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSuperheroes()
    }
    

    func fetchSuperheroes() {
        let url = "https://akabab.github.io/superhero-api/api/all.json"
        
        AF.request(url).responseDecodable(of: [Superhero].self) { response in
            switch response.result {
            case .success(let superheroesData):
                self.superheroes = superheroesData
                print("Superheroes fetched successfully.")
            case .failure(let error):
                self.showError(message: "Failed to fetch data: \(error.localizedDescription)")
            }
        }
    }
    

    @IBAction func randomizeButtonTapped(_ sender: UIButton) {
        displayRandomSuperhero()
    }
    
    func displayRandomSuperhero() {
        guard !superheroes.isEmpty else {
            showError(message: "No superheroes loaded yet.")
            return
        }
        
        let randomSuperhero = superheroes.randomElement()!
        nameLabel.text = randomSuperhero.name ?? "Unknown"
        
        // Use Kingfisher to load the image
        if let imageUrlString = randomSuperhero.images?.lg,
           let imageUrl = URL(string: imageUrlString) {
            imageView.kf.setImage(with: imageUrl)
        }
        
  
        powerstatsLabel.text = """
        Intelligence: \(randomSuperhero.powerstats?.intelligence ?? 0)
        Strength: \(randomSuperhero.powerstats?.strength ?? 0)
        Speed: \(randomSuperhero.powerstats?.speed ?? 0)
        Power: \(randomSuperhero.powerstats?.power ?? 0)
        Combat: \(randomSuperhero.powerstats?.combat ?? 0)
        """
        

        appearanceLabel.text = """
        Gender: \(randomSuperhero.appearance?.gender ?? "Unknown")
        Race: \(randomSuperhero.appearance?.race ?? "Unknown")
        Height: \(randomSuperhero.appearance?.height?.first ?? "Unknown")
        Weight: \(randomSuperhero.appearance?.weight?.first ?? "Unknown")
        """
        

        biographyLabel.text = """
        Full Name: \(randomSuperhero.biography?.fullName ?? "Unknown")
        Alignment: \(randomSuperhero.biography?.alignment ?? "Unknown")
        Publisher: \(randomSuperhero.biography?.publisher ?? "Unknown")
        """
        
        // Display Connections
        connectionsLabel.text = """
        Group: \(randomSuperhero.connections?.groupAffiliation ?? "Unknown")
        Relatives: \(randomSuperhero.connections?.relatives ?? "Unknown")
        """
    }
    

    func showError(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}
