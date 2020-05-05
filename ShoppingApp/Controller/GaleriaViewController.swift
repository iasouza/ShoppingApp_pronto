//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 16/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import UIKit
import Firebase

class GaleriaViewController: UIViewController {
    
    var shoppingBrain = ShoppingBrain()
    var nomeBandaTeste: String!
    var nomeDisco: [String] = []
    var nomeBanda: [String] = []
    var capaDisco: [String] = []
    var ano: [String] = []
    var preco: Double!
    var album: String!
    var artista: String!
    var capaAlbum: String!
    var anoAlbum: String!
    
    var produtos: [ProdutoModel] = []

    var produtoManager = ProdutoManager()
    
    @IBOutlet weak var nomeArtista: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "GaleriaTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        produtoManager.delegate = self
        produtoManager.fetchProduto(nomeArtista: nomeBandaTeste!)
    }
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "goToProduct"{
                    let destinationVC = segue.destination as! ProdutoViewController
                    destinationVC.nomeDisco = album
                    destinationVC.nomeBanda = artista
                    destinationVC.ano = anoAlbum
                    destinationVC.capa = capaAlbum
                }
    }
    
    @IBAction func fazerLogout(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Erro no logout: %@", signOutError)
        }
    }
}

extension GaleriaViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return produtos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! GaleriaTableViewCell
        
            let capa = URL(string: produtos[indexPath.row].capa)
            
            cell.nameLabel.text = produtos[indexPath.row].nomeDisco
            cell.bandaLabel.text = produtos[indexPath.row].nomeBanda
            if let capaURL = capa{
                cell.albumImageView.load(url: capaURL)
        }
         return cell
    }
}

extension GaleriaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        anoAlbum = produtos[indexPath.row].ano
        album = produtos[indexPath.row].nomeDisco
        artista = produtos[indexPath.row].nomeBanda
        capaAlbum = produtos[indexPath.row].capa
        
        self.performSegue(withIdentifier: "goToProduct", sender: nil)
        
        
    }
}

extension GaleriaViewController: ProdutoManagerDelegate{
    
    func didUpdateProduto(_ produtoManager: ProdutoManager, produtos: [ProdutoModel])
    {
        DispatchQueue.main.async {
            self.produtos = produtos
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

