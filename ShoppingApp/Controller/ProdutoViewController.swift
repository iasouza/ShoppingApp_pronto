//
//  ProdutoViewController.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 17/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import UIKit

class ProdutoViewController: UIViewController {

    @IBOutlet weak var bandaLabel: UILabel!
    @IBOutlet weak var discoLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var capaImage: UIImageView!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var quantidadeLabel: UILabel!
    @IBOutlet weak var qtdStepper: UIStepper!
    
    var nomeBanda: String?
    var nomeDisco: String?
    var ano: String?
    var preco: Double?
    var capa: String?
    var quantidade = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bandaLabel.text = nomeBanda
        discoLabel.text = nomeDisco
        anoLabel.text = ano
        precoLabel.text = String(format:"R$ %.2f", preco ?? 0.00)
        capaImage.image = UIImage(named: capa ?? "ACDC.jpg")
        quantidadeLabel.text = String(format: "%.0f",qtdStepper.value)
        
    }
    
    @IBAction func voltarGaleria(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func qtdValueChanged(_ sender: UIStepper) {
        quantidade = qtdStepper.value
        quantidadeLabel.text = String(format: "%.0f",qtdStepper.value)
    }
    
    @IBAction func comprarProduto(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToCart", sender: nil)
    }
    
    
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "goToCart"{
            let destinationVC = segue.destination as! CarrinhoViewController
            destinationVC.nomeDisco = nomeDisco
            destinationVC.capa = capa
            destinationVC.preco = preco
            destinationVC.quantidade = quantidade
        }
    }
    

}
