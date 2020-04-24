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
    var nomeBandaTeste: String!
    var nomeDisco: String = ""
    var nomeBanda: String = ""
    var capaDisco: String = ""
    var ano: String = ""
    var preco: Double!
    
    var quantidade: Int = 1
    
    var produtoManager = ProdutoManager()
    
    @IBOutlet weak var nomeArtista: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "GaleriaTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        produtoManager.delegate = self
        produtoManager.fetchProduto(nomeArtista: nomeBandaTeste!)
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
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! GaleriaTableViewCell
        
       
        let capa = URL(string: self.capaDisco)
        
        cell.nameLabel.text = self.nomeDisco
        cell.bandaLabel.text = self.nomeBanda
        if let capaURL = capa{
               cell.albumImageView.load(url: capaURL)
        }
     
        return cell
    }
    
}

extension GaleriaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        nomeDisco = produtoManager.
//        nomeBanda = shoppingBrain.galeria[indexPath.row].nomeBanda
//        capaDisco = shoppingBrain.galeria[indexPath.row].capa
//        ano = shoppingBrain.galeria[indexPath.row].ano
//        preco = shoppingBrain.galeria[indexPath.row].preco
        self.performSegue(withIdentifier: "goToProduct", sender: nil)
        
        
    }
}

extension GaleriaViewController: ProdutoManagerDelegate{
    
    func didUpdateProduto(_ produtoManager: ProdutoManager, produto: ProdutoModel)
    {
       DispatchQueue.main.async {
            self.nomeDisco = produto.nomeDisco
            self.nomeBanda = produto.nomeBanda
            self.capaDisco = produto.capa
            self.ano = produto.ano
        
        self.tableView.reloadData()
       }
        
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

