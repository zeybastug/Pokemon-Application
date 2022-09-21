//
//  ControllerProtocol.swift
//  Otsimo_Task
//
//  Created by Zeynep Baştuğ on 20.09.2022.
//

import Foundation
import UIKit

protocol ControllerProtocol {
    
    var x:ViewProtocol!{get set}
        
    var next:String!{get set}
    
    func getPokemonList(url:URL)
    
    func getPokemonInfo(url:URL)
    
    func imageForUrl(urlString: String,completionHandler :@escaping (_ image: UIImage?, _ url: String) -> ())
   
}
