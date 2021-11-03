//
//  descriptionPetViewController.swift
//  Pets
//
//  Created by Erick Martins on 01/11/21.
//

import UIKit

class descriptionPetViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var petNameLabel: UILabel!
    
    @IBOutlet weak var petSpecieLabel: UILabel!
    
    @IBOutlet weak var petBirthDateLabel: UILabel!
    
    let pet: Pet
    
    init(selectedPet: Pet){
        pet = selectedPet
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1).cgColor
        photoImageView.layer.borderWidth = 2
        
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width/2
        photoImageView.clipsToBounds = true
        
        photoImageView.image = pet.petImage
        petNameLabel.text = pet.petName
        petSpecieLabel.text = pet.petSpecie
        petBirthDateLabel.text = pet.petBirthDate
    
        title = "Descrição"
    }
}
