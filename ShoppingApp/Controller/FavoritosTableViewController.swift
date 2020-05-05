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
        return produtos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritosCell", for: indexPath) as! FavoritosTableViewCell
        cell.nome.text = produtos[indexPath.row].nomeDisco
        cell.banda.text = produtos[indexPath.row].nomeBanda
        
        let capa = URL(string: produtos[indexPath.row].capa)
    
        if let capaURL = capa{
                cell.capa.load(url: capaURL)
        }
        
        return cell
        }
        
        
//        cell.nameLabel.text = self.produtos[indexPath.row].nomeDisco
//        cell.bandaLabel.text = self.produtos[indexPath.row].nomeBanda
        
//        if let capaString = self.produtos[indexPath.row].capa{
//            let capaURL = URL(string: self.produtos[indexPath.row].capa)
//            if let capaEnd = capaURL{
//                cell.albumImageView.load(url: capaEnd)
//            }
//        }
        
       // cell.albumImageView.image = UIImage(named: capa ?? "ACDC.jpg")
        
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
