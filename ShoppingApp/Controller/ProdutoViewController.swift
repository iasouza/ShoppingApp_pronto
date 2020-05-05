//
//  ProdutoViewController.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 17/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import UIKit
import Firebase

class ProdutoViewController: UIViewController {


    @IBOutlet weak var bandaLabel: UILabel!
    @IBOutlet weak var discoLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var capaImage: UIImageView!

    @IBOutlet weak var favoritoBotao: UIButton!
    
    let db = Firestore.firestore()
    var estaNaLista: Bool = false
    
    var nomeBanda: String?
    var nomeDisco: String?
    var ano: String?
    var capa: String?
   
    var documentID: String = "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        if let disco = self.nomeDisco{
        db.collection("favoritos").whereField("Disco", isEqualTo: disco)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    if querySnapshot!.documents.count > 0 {
                        self.favoritoBotao.isSelected = true
                        self.estaNaLista = true
                        for document in querySnapshot!.documents{
                            self.documentID = document.documentID
                    }
                }
        }
        
        }
        
    
        bandaLabel.text = nomeBanda
        discoLabel.text = nomeDisco
        anoLabel.text = ano

        if let capaString = capa{
            let capaURL = URL(string: capaString)
            if let capaEnd = capaURL{
                   capaImage.load(url: capaEnd)
            }
        }
    
        
    }
    }
    @IBAction func Favoritar(_ sender: UIButton) {
        
        
        
        if estaNaLista == false{
                
                if let messageSender = Auth.auth().currentUser?.email{
                    db.collection("favoritos").addDocument(data: ["sender": messageSender, "Disco": nomeDisco, "Banda": nomeBanda, "Ano": ano, "Capa": capa ]) { (error) in
                        if let e = error {
                            print (e.localizedDescription)
                        }else{
                            self.favoritoBotao.isSelected.toggle()
                            print("Salvo com sucesso")
                        }
                    }
              }
        }else{
            db.collection("favoritos").document(documentID).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    self.favoritoBotao.isSelected.toggle()
                    
                }
            }
        }
       
    }
}

