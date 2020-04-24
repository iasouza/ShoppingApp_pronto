//
//  ShoppingBrain.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 17/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import Foundation

struct ShoppingBrain{
   
    
    let galeria = [Produto(nomeDisco: "Back in Black", nomeBanda: "ACDC", ano: "1980", preco: 165.00, capa: "ACDC.jpg"), Produto(nomeDisco: "As Aventuras da Blitz 1", nomeBanda: "Blitz", ano: "1982", preco: 30.00, capa: "Blitz.jpg"), Produto(nomeDisco: "Slippery When Wet", nomeBanda: "Bon Jovi", ano: "1986", preco: 200.91, capa: "BonJovi.jpg"), Produto(nomeDisco: "Born in the USA", nomeBanda: "Bruce Springsteen", ano: "1984", preco: 124.00, capa: "BruceSpringsteen.jpg"),Produto(nomeDisco: "Brothers in Arms", nomeBanda: "Dire Straits", ano: "1985", preco: 228.90, capa: "DireStraits.jpg"), Produto(nomeDisco: "Appetite for Destruction", nomeBanda: "Guns'n Roses", ano: "1987", preco: 180.00, capa: "GunsnRoses.jpg"), Produto(nomeDisco: "Seu Espião", nomeBanda: "Kid Abelha", ano: "1984", preco: 55.00, capa: "KidAbelha.jpg"), Produto(nomeDisco: "Like a Virgin", nomeBanda: "Madonna", ano: "1984", preco: 180.51, capa: "Madonna.jpg"),Produto(nomeDisco: "Thriller", nomeBanda: "Michael Jackson", ano: "1982", preco: 125.66, capa: "MichaelJackson.jpg"), Produto(nomeDisco: "Instrospective", nomeBanda: "Pet Shop Boys", ano: "1988", preco: 191.23, capa: "PetShopBoys.jpg"), Produto(nomeDisco: "Revoluções por Minuto", nomeBanda: "RPM", ano: "1985", preco: 25.00, capa: "RPM.jpg"), Produto(nomeDisco: "Nós Vamos Invadir Sua Praia", nomeBanda: "Ultraje a Rigor", ano: "1985", preco: 61.75, capa: "UltrajeaRigor.jpg")]

    func getNomeDisco(nomeBanda: String) -> String{
        
        var discoNome: String = ""
        
        for disco in galeria{
            if disco.nomeBanda == nomeBanda{
                discoNome = disco.nomeDisco
            }
        }
        return discoNome
    }
    
    func getAno (nomeBanda: String) -> String{
        
        var ano: String = ""
        
        for disco in galeria{
            if disco.nomeBanda == nomeBanda{
                ano = disco.ano
            }
        }
        return ano
    }
 
    func getPreco (nomeBanda: String) -> Double{
     
        var preco: Double = 0.0
     
        for disco in galeria{
            if disco.nomeBanda == nomeBanda{
                preco = disco.preco
         }
     }
        return preco
 }
    
    func getCapa (nomeBanda: String) -> String{
        
        var capa: String = ""
        
           for disco in galeria{
               if disco.nomeBanda == nomeBanda{
                   capa = disco.capa
            }
        }
           return capa
    }
    

}
