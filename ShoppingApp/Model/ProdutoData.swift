//
//  ProdutoModel.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 24/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import Foundation

struct ProdutoData: Codable{
    let album: [Album]
    
}

struct Album: Codable{
    let strArtist: String?
    let intYearReleased: String?
    let strAlbumThumb: String?
    let strAlbum: String?
}
