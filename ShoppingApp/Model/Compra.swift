//
//  Compra.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 17/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import Foundation

struct  Compra {
    
    var quantidade: Double
    var preco: Double
    
    mutating func calculaTotal() -> Double{
        return quantidade*preco
    }
    
}
