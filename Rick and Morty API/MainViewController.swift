//
//  MainViewController.swift
//  Rick and Morty API
//
//  Created by Roman on 18.01.2022.
//

import UIKit

class MainViewController: UITableViewController {
    var persons: [Results] = []
    var fullSettings: RickAndMorty!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPerson()
        
    }

// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RickMortyCell", for: indexPath) as! RickMortyCell

        let person = persons[indexPath.row]
        cell.configure(with: person)
        
        return cell

}

}


extension MainViewController {
    func fetchPerson() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data = data, let responce = responce else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(responce)
            
            do {
                self.fullSettings = try JSONDecoder().decode(RickAndMorty.self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }

        }.resume()
    }
}
