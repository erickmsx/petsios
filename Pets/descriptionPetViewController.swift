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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Descrição do pet"

    }


}
