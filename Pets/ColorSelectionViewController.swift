//
//  ColorSelectionViewController.swift
//  Pets
//
//  Created by Erick Martins on 09/11/21.
//

import UIKit

protocol ColorSelection {
    
    func didSelectColor(color: UIColor)
}

class ColorSelectionViewController: UIViewController {
    
    var delegate: ColorSelection?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func colorRedSelected(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        delegate?.didSelectColor(color: .red)
    }
    
    @IBAction func colorYellowSelected(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        delegate?.didSelectColor(color: .yellow)
    }
    
    @IBAction func colorGreenSelected(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        delegate?.didSelectColor(color: .green)
    }
    
    @IBAction func colorOrangeSelected(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        delegate?.didSelectColor(color: .orange)
    }
}
