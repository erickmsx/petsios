//
//  ViewController.swift
//  Pets
//
//  Created by Erick Martins on 30/10/21.
//

//windows + Shift + o = pesquisa por arquivo

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonListPet(_ sender: Any) {
    
        let petListVC = ListPetViewController()
        navigationController?.pushViewController(petListVC, animated: true)
    }
    
    @IBAction func buttonRegisterPet(_ sender: Any) {
        
        let registerPetVC = RegisterPetViewController()
        navigationController?.pushViewController(registerPetVC, animated: true)
    }
    
}

