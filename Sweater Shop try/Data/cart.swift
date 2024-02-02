//
//  cart.swift
//  Sweater Shop try
//
//  Created by Nithin on 30/10/23.
//

import Foundation
struct cart{
    var name:String
    var cost:Double
    var size:String
    var image:String
}
class cartmanager{
    
    static let shared = cartmanager()
    var carts:[cart]=[]
    
    func addcart(_ Cart:cart){
        carts.append(Cart)
    }
    
    
}

