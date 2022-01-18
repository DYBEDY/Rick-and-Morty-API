//
//  MainViewController.swift
//  Rick and Morty API
//
//  Created by Roman on 18.01.2022.
//

import UIKit

class MainViewController: UITableViewController {
   private var persons: [Results] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

// MARK: - Table view data source
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rick", for: indexPath) as! RickMortyCell

        let person = persons[indexPath.row]
        cell.configure(with: person)
        
        return cell

}

    func fetchPerson() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                self.persons = try JSONDecoder().decode([Results].self, from: data)
                print(self.persons)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
            
        } .resume()
    }
}

