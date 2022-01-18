//
//  RickMortyCell.swift
//  Rick and Morty API
//
//  Created by Roman on 18.01.2022.
//

import UIKit

class RickMortyCell: UITableViewCell {
    
    @IBOutlet var nameOfPersonLabel: UILabel!
    @IBOutlet var typeOfPersonLabel: UILabel!
    @IBOutlet var imageOfPerson: UIImageView!
    
    
    func configure(with person: Results) {
        nameOfPersonLabel.text = person.name
        typeOfPersonLabel.text = person.type
        
        DispatchQueue.global().async {
            guard let url = URL(string: person.image ?? "" ) else { return }
            guard let imageData = try?Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.imageOfPerson.image = UIImage(data: imageData)
            }
            
        }
    }
    
}



