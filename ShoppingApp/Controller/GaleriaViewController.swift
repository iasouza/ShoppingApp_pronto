//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 16/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import UIKit

class GaleriaViewController: UIViewController {

    var nomeBanda: String?
    var shoppingBrain = ShoppingBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func productSelected(_ sender: UIButton) {
        
        nomeBanda = sender.currentTitle!
        
        self.performSegue(withIdentifier: "goToProduct", sender: nil)
        
        
    }
    

    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProduct"{
            let destinationVC = segue.destination as! ProdutoViewController
            destinationVC.nomeDisco = shoppingBrain.getNomeDisco(nomeBanda: nomeBanda!)
            destinationVC.nomeBanda = nomeBanda
            destinationVC.ano = shoppingBrain.getAno(nomeBanda: nomeBanda!)
            destinationVC.preco = shoppingBrain.getPreco(nomeBanda: nomeBanda!)
            destinationVC.capa = shoppingBrain.getCapa(nomeBanda: nomeBanda!)
        }
    }
   
}

