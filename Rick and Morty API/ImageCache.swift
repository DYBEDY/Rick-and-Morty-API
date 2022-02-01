//
//  ImageCache.swift
//  Rick and Morty API
//
//  Created by Roman on 01.02.2022.
//

import UIKit

class imageCache  {
    static let shared = NSCache<NSString, UIImage>()
    
    
    private init() {}
    
    
}
