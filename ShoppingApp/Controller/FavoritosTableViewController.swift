//
//  FavoritosTableViewController.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 04/05/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import UIKit
import Firebase

class FavoritosTableViewController: UITableViewController {
    
    var produtos: [Produto] = []
    let db  = Firestore.firestore()
    
    var album: String!
    var artista: String!
    var capaAlbum: String!
    var anoAlbum: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }
    func loadData(){
        db.collection("favoritos").addSnapshotListener { (querySnapshot, error) in
            self.produtos = []
            if let e = error{
                print(e)
            }else{
                if let snapShopDocuments = querySnapshot?.documents{
                    for doc in snapShopDocuments{
                        let data = doc.data()
                        
                        if let nomeDisco = data["Disco"] as? String, let nomeBanda = data["Banda"] as? String, let ano = data["Ano"] as? String, let capa = data["Capa"] as? String
                        {
                            let novoProduto = Produto( nomeDisco: nomeDisco, nomeBanda: nomeBanda, ano: ano, capa: capa)
                            
                            self.produtos.append(novoProduto)
                            
                            DispatchQueue.main.async{
                                self.tableView.reloadData()
                            }
                            
                        }
                        
                        
                    }
                }
                
            }
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if produtos.count == 0{
            return 1
        }else {
            return produtos.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritosCell", for: indexPath) as! FavoritosTableViewCell
        if produtos.count > 0{
            cell.semFavoritos.text = ""
            cell.nome.text = produtos[indexPath.row].nomeDisco
            cell.banda.text = produtos[indexPath.row].nomeBanda
            
            let capa = URL(string: produtos[indexPath.row].capa)
            
            if let capaURL = capa{
                cell.capa.load(url: capaURL)
            }
        }else{
            cell.nome.text = ""
            cell.banda.text = ""
            cell.semFavoritos.text = "Você ainda não tem favoritos"
            
            
        }
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail"{
            let destinationVC = segue.destination as! ProdutoViewController
            destinationVC.nomeDisco = album
            destinationVC.nomeBanda = artista
            destinationVC.ano = anoAlbum
            destinationVC.capa = capaAlbum
        }
    }
    
}
extension FavoritosTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        anoAlbum = produtos[indexPath.row].ano
        album = produtos[indexPath.row].nomeDisco
        artista = produtos[indexPath.row].nomeBanda
        capaAlbum = produtos[indexPath.row].capa
        
        self.performSegue(withIdentifier: "goToDetail", sender: nil)
        
        
    }
}
