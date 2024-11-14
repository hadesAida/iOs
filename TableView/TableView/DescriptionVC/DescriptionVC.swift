//
//  DescriptionVC.swift
//  TableView
//
//  Created by aida madraimova on 13.11.2024.
//

import UIKit

class DescriptionVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
      let descriptionData = [
          ["Title: The Count of Monte Cristo",
           "Release date: 2024",
           "Description: After escaping from an island prison where he spent 14 years for being wrongly accused of state treason, Edmond Dantès returns as the Count of Monte Cristo to exact revenge on the men who betrayed him."],
          ["Title: The Selection", "Release Date: 2012","Description: Thirty-five beautiful girls. Thirty-five beautiful rivals...It's the chance of a lifetime and 17-year-old America Singer should feel lucky. She has been chosen for The Selection, a reality TV lottery in which the special few compete for gorgeous Prince Maxon's love. Swept up in a world of elaborate gowns, glittering jewels and decadent feasts, America is living a new and glamorous life. And the prince takes a special interest in her, much to the outrage of the others. Rivalry within The Selection is fierce and not all of the girls are prepared to play by the rules. But what they don't know is that America has a secret - one which could throw the whole competition...and change her life forever."],
          ["Name: Selena Gomez",
           "Birth year: 1992",
           "Her best album: Revival",
           "Music genre: Pop"],
          ["Name: Dany Boon",
           "Birth Year: 1966",
           "Best movie: Radin"],
          ["Name: Burger",
        "Country: US"],
          ["Name: Mega",
           "Adress: Rozybakiev street"],
          ["Title: The Sims 4",
           "Release date: 2014",
           "Genre: life simulator"]
          
          
          
          
      ]
    
    
    
    var descriptionIndex: Int!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.tableView.dataSource = self
            self.tableView.delegate = self
            
            let  nib = UINib(nibName: "DescriptionCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "descriptionCell")

            // Do any additional setup after loading the view.
        }
        func customInit(descriptionIndex: Int, title: String){
            self.descriptionIndex = descriptionIndex
            self.title = title
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return descriptionData[descriptionIndex].count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! DescriptionCell
            cell.textLabel?.text = descriptionData[descriptionIndex][indexPath.row]
            return cell
            
        }


        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }
