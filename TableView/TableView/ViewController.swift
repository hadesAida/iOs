//
//  ViewController.swift
//  TableView
//
//  Created by aida madraimova on 13.11.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var favoriteData = ["Favorite movie", "Favorite Book", "Favorite singer","Favorite actor", "Favorite food", "Favorite Shopping mall", "Favorite game"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return favoriteData.count
       }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
           cell.textLabel?.text = favoriteData[indexPath.row]
           return cell
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let descriptionVC = DescriptionVC()
           descriptionVC.customInit(descriptionIndex: indexPath.row, title: favoriteData[indexPath.row])
           self.navigationController?.pushViewController(descriptionVC, animated: true)
           tableView.deselectRow(at: indexPath, animated: true)
       }


}

