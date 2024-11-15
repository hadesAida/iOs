//
//  ViewController.swift
//  CustomTableView
//
//  Created by aida madraimova on 15.11.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    struct Movie {
        let title: String
        let year: String
        let genre: String
        let posterImageName: String
    }
    
    let movies: [Movie] = [
            Movie(title: "Crazy wedding", year: "2024", genre: "Comedy", posterImageName: "k"),
            Movie(title: "Interstellar", year: "2014", genre: "Fantastic", posterImageName: "l"),
            Movie(title: "3 Idiots", year: "2007", genre: "Comedy", posterImageName: "m"),
            Movie(title: "Tag", year: "2018", genre: "Comedy", posterImageName: "n"),
            Movie(title: "Baywatch", year: "2017", genre: "Comedy", posterImageName: "o")
        ]
        


    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        
            }
            
            // MARK: - UITableViewDataSource Methods
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return movies.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
                let movie = movies[indexPath.row]
                
                // Configure the cell
                cell.label.text = movie.title
                cell.YearLabel.text = movie.year
                cell.GenreLabel.text = movie.genre
                cell.iconImageView.image = UIImage(named: movie.posterImageName)
                
                return cell
            }
            
            // MARK: - UITableViewDelegate Methods (optional)
            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                tableView.deselectRow(at: indexPath, animated: true)
                // Add any action when a cell is tapped (optional)
            }
        }
