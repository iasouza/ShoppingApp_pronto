//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 16/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import UIKit

class GaleriaViewController: UIViewController {

    var shoppingBrain = ShoppingBrain()
    
    var nomeDisco: String!
    var nomeBanda: String!
    var capaDisco: String!
    var ano: String!
    var preco: Double!
    
    @IBOutlet weak var nomeArtista: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "GaleriaTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
 
    @IBOutlet weak var tableView: UITableView!


    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProduct"{
            let destinationVC = segue.destination as! ProdutoViewController
            destinationVC.nomeDisco = nomeDisco
            destinationVC.nomeBanda = nomeBanda
            destinationVC.ano = ano
            destinationVC.preco = preco
            destinationVC.capa = capaDisco
        }
    }

}

extension GaleriaViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shoppingBrain.galeria.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! GaleriaTableViewCell
        
        cell.albumImageView.image = UIImage(named: shoppingBrain.galeria[indexPath.row].capa)
        cell.nameLabel.text = shoppingBrain.galeria[indexPath.row].nomeDisco
        cell.bandaLabel.text = shoppingBrain.galeria[indexPath.row].nomeBanda
        return cell
    }
    
}

extension GaleriaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        nomeDisco = shoppingBrain.galeria[indexPath.row].nomeDisco
        nomeBanda = shoppingBrain.galeria[indexPath.row].nomeBanda
        capaDisco = shoppingBrain.galeria[indexPath.row].capa
        ano = shoppingBrain.galeria[indexPath.row].ano
        preco = shoppingBrain.galeria[indexPath.row].preco
        
        self.performSegue(withIdentifier: "goToProduct", sender: nil)
        
        
    }
}

