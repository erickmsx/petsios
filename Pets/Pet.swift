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
    let petBirthDate: String
    var petImage: UIImage?
    let petColorBorder: UIColor
    let isPetVaccinated: Bool
    
    init(name: String, specie: String, birthDate: String, color: UIColor, isVaccinated: Bool){
        
        petName = name
        petSpecie = specie
        petBirthDate = birthDate
        petColorBorder = color
        isPetVaccinated = isVaccinated
    }
}
