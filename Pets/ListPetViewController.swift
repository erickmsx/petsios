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
    
    var filteredItems: [Pet] = []
    var isFiltering: Bool = false
    
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
        
        let filterButton = UIBarButtonItem(title: "Filtrar", style: .done, target: self, action: #selector(filterPets))
        
        navigationItem.rightBarButtonItems = [addButton, filterButton]
    }
    
    //opens the alertcontroller showing the options
    @objc func filterPets(){
        
        let alert = UIAlertController(title: "Pets", message: "Selecione uma opção", preferredStyle: .actionSheet)
        
        let vaccinatedButton = UIAlertAction(title: "Vacinados", style: .default) { (_) in
            
            self.filteredItems = []
            self.isFiltering = true
            for pet in petsList{
                
                if pet.isPetVaccinated {
                    self.filteredItems.append(pet)
                }
            }
            
            self.tableView.reloadData()
        }
        
        alert.addAction(vaccinatedButton)
        
        let notVaccinateButton = UIAlertAction(title: "Não vacinados", style: .default) { (_) in
            
            self.filteredItems = []
            self.isFiltering = true
            
            for pet in petsList{
                if !pet.isPetVaccinated{
                    self.filteredItems.append(pet)
                }
            }
            
            self.tableView.reloadData()
        }
        
        alert.addAction(notVaccinateButton)
        
        let allPetsButton = UIAlertAction(title: "Ver todos", style: .default) { (_) in
            
            self.isFiltering = false
            self.filteredItems = []
            self.tableView.reloadData()
            
        }
        
        alert.addAction(allPetsButton)
        
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)
        //end
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
                
        let billy = Pet(name: "Billy", specie: "Cachorro", birthDate: "11 de novembro", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), isVaccinated: true)
        petsList.append(billy)
        
        let pietra = Pet(name: "Pietra", specie: "Gato", birthDate: "12 de setembro", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), isVaccinated: false)
        petsList.append(pietra)
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering{
            return filteredItems.count
        } else{
            return petsList.count
        }
    }
    
    //Through the "cellPetId" we can multiply the cell that was created above on tableView.register...
    //Index the elements on the list through position in the list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! PetTableViewCell
        
        //let row = indexPath.row //for line
        //let pet = petsList[row] //list elements for line if it was just a list with no filter
        
        var pet: Pet
        if isFiltering{
            pet = filteredItems[indexPath.row]
        } else {
            pet = petsList[indexPath.row]
        }
        
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
        
        var pet: Pet
        if isFiltering{
            pet = filteredItems[indexPath.row]
        } else {
            pet = petsList[indexPath.row]
        }
        let descriptionPetVC = descriptionPetViewController(selectedPet: pet)
        
        navigationController?.pushViewController(descriptionPetVC, animated: true)
    }
}
