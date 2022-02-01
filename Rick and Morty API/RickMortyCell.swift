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
    @IBOutlet var imageOfPerson: UIImageView! {
        didSet {
            
            imageOfPerson.contentMode = .scaleAspectFit
            imageOfPerson.clipsToBounds = true
            imageOfPerson.layer.cornerRadius = imageOfPerson.frame.height / 2
            imageOfPerson.backgroundColor = .white
        }
    }
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    
    private var imageURL: URL? {
        didSet {
            imageOfPerson.image = nil
            
            updateImage()
        }
    }
    
    
    func configure(with person: Results?) {
        nameOfPersonLabel.text = person?.name
        typeOfPersonLabel.text = person?.type
        genderLabel.text = person?.gender
        speciesLabel.text = person?.species
        statusLabel.text = person?.status
        imageURL = URL(string: person?.image ?? "")
      
//        DispatchQueue.global().async {
//            guard let url = URL(string: person?.image ?? "" ) else { return }
//            guard let imageData = try? Data(contentsOf: url) else { return }
//
//
//            DispatchQueue.main.async {
//                self.imageOfPerson.image = UIImage(data: imageData)
//            }
//
//        }
        
    }
    
    
  
    
    private func updateImage() {
        guard let url = imageURL else { return }
        getImage(from: url) { result in
            switch result {
            case .success(let image):
                if url == self.imageURL {
                        self.imageOfPerson.image = image
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
    
    private func getImage(from url: URL, completion: @escaping(Result<UIImage, Error>) -> Void) {
        // Get image from cache
        if let cachedImage = imageCache.shared.object(forKey: url.lastPathComponent as NSString) {
            print("Image from cache", url.lastPathComponent)
            completion(.success(cachedImage))
            return
        }
        
        // Download image from url
        NetworManager.shared.fetchImage(from: url) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                imageCache.shared.setObject(image, forKey: url.lastPathComponent as NSString)
                print("Image from network: ", url.lastPathComponent)
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))            }
        
    }
    
}

}


