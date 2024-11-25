//
//  ViewController.swift
//  superHeroRandom
//
//  Created by aida madraimova on 25.11.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
       @IBOutlet weak var imageView: UIImageView!
       @IBOutlet weak var powerstatsLabel: UILabel!
       @IBOutlet weak var appearanceLabel: UILabel!
       @IBOutlet weak var biographyLabel: UILabel!
       @IBOutlet weak var connectionsLabel: UILabel!
       @IBOutlet weak var randomizeButton: UIButton! // Added button outlet
       

    var superheroes: [Superhero] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSuperheroes()
    }


    func fetchSuperheroes() {
        let url = URL(string: "https://akabab.github.io/superhero-api/api/all.json")!
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                self?.showError(message: "Network error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                self?.showError(message: "No data received.")
                return
            }
            do {
                self?.superheroes = try JSONDecoder().decode([Superhero].self, from: data)
            } catch {
                print("Decoding error: \(error.localizedDescription)")
                self?.showError(message: "Failed to decode data.")
            }
        }.resume()
    }


    func displayRandomSuperhero() {
        guard !superheroes.isEmpty else {
            showError(message: "No superheroes loaded yet.")
            return
        }

        let randomSuperhero = superheroes.randomElement()!
        
        UIView.animate(withDuration: 0.5, animations: {
            self.nameLabel.alpha = 0
            self.imageView.alpha = 0
            self.powerstatsLabel.alpha = 0
            self.appearanceLabel.alpha = 0
            self.biographyLabel.alpha = 0
            self.connectionsLabel.alpha = 0
        }) { _ in
          
            DispatchQueue.main.async {
                self.nameLabel.text = randomSuperhero.name ?? "Unknown"
                
                if let imageUrlString = randomSuperhero.images?.lg, let imageUrl = URL(string: imageUrlString) {
                    self.loadImage(from: imageUrl)
                } else {
                    self.imageView.image = nil
                }

                self.powerstatsLabel.text = """
                Intelligence: \(randomSuperhero.powerstats?.intelligence ?? 0)
                Strength: \(randomSuperhero.powerstats?.strength ?? 0)
                Speed: \(randomSuperhero.powerstats?.speed ?? 0)
                Power: \(randomSuperhero.powerstats?.power ?? 0)
                Combat: \(randomSuperhero.powerstats?.combat ?? 0)
                """

                self.appearanceLabel.text = """
                Gender: \(randomSuperhero.appearance?.gender ?? "Unknown")
                Race: \(randomSuperhero.appearance?.race ?? "Unknown")
                Height: \(randomSuperhero.appearance?.height?.first ?? "Unknown")
                Weight: \(randomSuperhero.appearance?.weight?.first ?? "Unknown")
                """

                self.biographyLabel.text = """
                Full Name: \(randomSuperhero.biography?.fullName ?? "Unknown")
                Alignment: \(randomSuperhero.biography?.alignment ?? "Unknown")
                Publisher: \(randomSuperhero.biography?.publisher ?? "Unknown")
                """

                self.connectionsLabel.text = """
                Group: \(randomSuperhero.connections?.groupAffiliation ?? "Unknown")
                Relatives: \(randomSuperhero.connections?.relatives ?? "Unknown")
                """

                
                UIView.animate(withDuration: 0.5, animations: {
                    self.nameLabel.alpha = 1
                    self.imageView.alpha = 1
                    self.powerstatsLabel.alpha = 1
                    self.appearanceLabel.alpha = 1
                    self.biographyLabel.alpha = 1
                    self.connectionsLabel.alpha = 1
                })
            }
        }
    }

 
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }.resume()
    }

  
    func showError(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }

   
       @IBAction func randomizeButtonTapped(_ sender: UIButton) {
           displayRandomSuperhero()
       }
   }
