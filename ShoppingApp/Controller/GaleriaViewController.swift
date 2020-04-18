//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 16/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import UIKit

class GaleriaViewController: UIViewController {
    
    var banda = "ACDC"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func selecionaProduto(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToProduct", sender: nil)
        
        
    }
    
    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "goToProduct"{
            let destinationVC = segue.destination as! ProdutoViewController
            destinationVC.nomeBanda = banda
        }
    }
   
    
    
}

