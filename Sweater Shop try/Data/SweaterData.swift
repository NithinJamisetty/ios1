//
//  SweaterData.swift
//  Sweater Shop try
//
//  Created by Nithin on 27/10/23.
//

import Foundation
class SweaterData{
    var sweatername:String = ""
    var cost:Double = 0.0
    var rating:Double = 0.0
    var sweaterPhoto:String = ""
    
    init(sName:String,cName:Double,rName:Double,photoSweater:String){
        sweatername = sName
        cost = cName
        rating = rName
        sweaterPhoto = photoSweater
    }
    
}
