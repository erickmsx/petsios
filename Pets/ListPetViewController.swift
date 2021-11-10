//
//  ListPetViewController.swift
//  Pets
//
//  Created by Erick Martins on 31/10/21.
//

import UIKit
var petsList: [Pet] = []

//implement func of UITableViewDataSource
class ListPetViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, addPetDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellId = "cellPetId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lista de pets"
        
        //configurePetList()
        configureTableView()
        setupNavBar()
    }
    
    //add the button + in the navigation
    func setupNavBar(){
        
        title = "Lista de pets"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPet))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addPet(){
        
        let addRegisterPetVC = RegisterPetViewController()
        addRegisterPetVC.delegate = self
        present(addRegisterPetVC, animated: true, completion: nil)
    }
    
    func didAddPet(pet: Pet){
        tableView.reloadData()
    }
    
    //end
    
    //Identify where is the tableviewcell and use the identifier to create and recreate the cell
    func configureTableView(){
        
        tableView.register(UINib(nibName: "PetTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        tableView.dataSource = self// define who is the data info
        tableView.delegate = self// define who is receiving data info
    }
    
    /*func configurePetList(){
     
     let billy = Pet(name: "Billy", specie: "Cachorro", birthDate: "10/12/2022")
     petsList.append(billy)
     
     let pietra = Pet(name: "Pietra", specie: "Gato", birthDate: "15/03/2022")
     petsList.append(pietra)
     }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petsList.count
    }
    
    //Through the "cellPetId" we can multiply the cell that was created above on tableView.register...
    //Index the elements on the list through position in the list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! PetTableViewCell
        
        let row = indexPath.row //for line
        let pet = petsList[row] //list elements for line
        
        cell.petNameLabel.text = pet.petName
        cell.petSpecieLabel.text = pet.petSpecie
        cell.petImageView.image = pet.petImage
        cell.selectionStyle = .none //take off effect when cell is clicked
        cell.petImageView.layer.borderColor = pet.petColorBorder.cgColor
        
        //Field if pet is vaccinated or not on tableview
        if pet.isPetVaccinated {
            
            cell.isVaccinatedLabel.text = "Pet vacinado"
            
        }else {
            cell.isVaccinatedLabel.text = "Pet não vacinado"
        }
        
        return cell
        //Adjust row height 100 in ListPetViewController.xib/TableView/6 item
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        let pet = petsList[row]
        let descriptionPetVC = descriptionPetViewController(selectedPet: pet)
        
        navigationController?.pushViewController(descriptionPetVC, animated: true)
    }
}
