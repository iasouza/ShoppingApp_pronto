//
//  CarrinhoViewController.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 17/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import UIKit

class CarrinhoViewController: UIViewController {

    @IBOutlet weak var nomeDiscoLabel: UILabel!
    @IBOutlet weak var capaDisco: UIImageView!
    @IBOutlet weak var quantidadeLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var valorTotalLabel: UILabel!
    
    var nomeDisco: String?
    var capa: String?
    var preco: Double?
    var quantidade: Double?
    var valorTotal: Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nomeDiscoLabel.text = nomeDisco
        precoLabel.text = String(format:"R$ %.2f",preco ?? 0.00)
        capaDisco.image = UIImage(named: capa ?? "ACDC.jpg")
        quantidadeLabel.text = String(format:"%.0f",quantidade ?? 1.00)
        var compra = Compra(quantidade: quantidade!, preco: preco!)
        valorTotal = compra.calculaTotal()
        valorTotalLabel.text = String(format: "R$ %.2f", valorTotal ?? 0.00)
    }
    
    @IBAction func finalizarCompra(_ sender: Any) {
      performSegue(withIdentifier: "unwindSegueToGaleria", sender: nil)
    }

}
