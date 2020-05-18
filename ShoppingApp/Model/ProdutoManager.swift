//
//  ProdutoManager.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 24/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import Foundation

protocol ProdutoManagerDelegate {
    func didUpdateProduto(_ produtoManager: ProdutoManager, produtos: [ProdutoModel])
    
}

struct ProdutoManager{
    
    
    var delegate: ProdutoManagerDelegate?
    
    let produtoURL = "https://theaudiodb.com/api/v1/json/1/searchalbum.php?"
    
    func fetchProduto(nomeArtista: String){
        
        let artista = nomeArtista.replacingOccurrences(of: " ", with: "_")
        let urlString = "\(produtoURL)&s=\(artista)"
        
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
                    if let produto = self.parseJSON(safeData) {
                        self.delegate?.didUpdateProduto(self, produtos: produto)
                    }
                }
            }
            //4. Start the task
            task.resume()
        }
        
    }
    
    func parseJSON(_ produtoData: Data)-> [ProdutoModel]?{
        
        let decoder = JSONDecoder()
        var cont = 0
        var produtos: [ProdutoModel] = []
        
        do{
            let decodedData = try decoder.decode(ProdutoData.self, from: produtoData)
            
            while cont < decodedData.album.count {
                let album = decodedData.album[cont].strAlbum ?? "Não encontrado"
                let artista = decodedData.album[cont].strArtist ?? "Não encontrado"
                let capa = decodedData.album[cont].strAlbumThumb ?? "https://complianz.io/wp-content/uploads/2019/03/placeholder-300x202.jpg"
                let ano = decodedData.album[cont].intYearReleased ?? "Sem ano"
                let produto = ProdutoModel(nomeDisco: album, nomeBanda: artista, ano: ano, capa: capa)
                produtos.append(produto)
                cont += 1
            }
            
            return produtos
        } catch {
            print(error)
            return nil
        }
        
    }
    
    
    
}
