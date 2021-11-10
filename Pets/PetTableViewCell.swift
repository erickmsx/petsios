//
//  PetTableViewCell.swift
//  Pets
//
//  Created by Erick Martins on 31/10/21.
//

import UIKit

class PetTableViewCell: UITableViewCell {

    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petSpecieLabel: UILabel!
    @IBOutlet weak var isVaccinatedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        petImageView.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1).cgColor
        petImageView.layer.borderWidth = 2
    
        petImageView.layer.cornerRadius = petImageView.frame.size.width/2
        petImageView.clipsToBounds = true
    
    }
}
