//
//  Pet.swift
//  Pets
//
//  Created by Erick Martins on 31/10/21.
//

import UIKit //trade foundation for uikit to get UIImage access

class Pet{
    
    let petName: String
    let petSpecie: String
    let petImage: UIImage
    
    init(name: String, specie: String, image: UIImage){
        
        petName = name
        petImage = image
        petSpecie = specie
    }
}
