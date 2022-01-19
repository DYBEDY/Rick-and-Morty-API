//
//  MainViewController.swift
//  Rick and Morty API
//
//  Created by Roman on 18.01.2022.
//

import UIKit

class MainViewController: UITableViewController {
   private var persons: RickAndMorty?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 160
        fetchData()
    }

// MARK: - Table view data source
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons?.results?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rick", for: indexPath) as! RickMortyCell

        let person = persons?.results?[indexPath.row]
        cell.configure(with: person)

        return cell

}

    private func fetchData() {
        NetworManager.shared.fetch(dataType: RickAndMorty.self, from: "https://rickandmortyapi.com/api/character") { result in
            switch result {
            case .success(let person):
                self.persons = person
                self.tableView.reloadData()
                print(person)
            case .failure(let error):
                print(error)
            }
        }
    }
    
 

}

