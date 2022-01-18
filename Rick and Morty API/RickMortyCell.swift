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
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    
    
    func configure(with person: Results?) {
        nameOfPersonLabel.text = person?.name
        typeOfPersonLabel.text = person?.type
        genderLabel.text = person?.gender
        speciesLabel.text = person?.species
        statusLabel.text = person?.status
        
        DispatchQueue.global().async {
            guard let url = URL(string: person?.image ?? "" ) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.imageOfPerson.image = UIImage(data: imageData)
            }
            
        }
    }
}




