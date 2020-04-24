//
//  ProdutoManager.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 24/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import Foundation

protocol ProdutoManagerDelegate {
    func didUpdateProduto(_ produtoManager: ProdutoManager, produto: ProdutoModel)

}

struct ProdutoManager{
     
    var delegate: ProdutoManagerDelegate?
    
    let produtoURL = "https://theaudiodb.com/api/v1/json/1/searchalbum.php?"
    
    func fetchProduto(nomeArtista: String){
           
           let urlString = "\(produtoURL)&s=\(nomeArtista)"
           performRequest(with: urlString)
           
       }
 
    func performRequest(with urlString: String){
        //1. Create URL
        if let url = URL(string: urlString){
            //2. Create URLSession
            let session = URLSession(configuration: .default)
            //3. Give URLSession a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let produto = self.parseJSON(safeData){
                        self.delegate?.didUpdateProduto(self, produto: produto)
                    }
                }
            }
            
            //4. Start the task
            task.resume()
        }
        
    }
    
    func parseJSON(_ produtoData: Data)-> ProdutoModel?{
        
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(ProdutoData.self, from: produtoData)
            let album = decodedData.album[0].strAlbum
            let artista = decodedData.album[0].strArtist
            let capa = decodedData.album[0].strAlbumThumb
            let ano = decodedData.album[0].intYearReleased
            let produto = ProdutoModel(nomeDisco: album, nomeBanda: artista, ano: ano, capa: capa)
            return produto
        } catch {
            print(error)
            return nil
        }
        
    }
    
    
    
}
