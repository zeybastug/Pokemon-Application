//
//  ViewController.swift
//  Otsimo_Task
//
//  Created by Zeynep Baştuğ on 21.09.2022.
//

import Foundation
import UIKit

protocol ViewProtocol {
    
    var loadingView: UIView! { get }
    
    var secondView: UIView! { get }
    
    var firstView: UIView! { get }
    
    func setCardValues(card:Card)
    
    func setPokemonList(list: [PokemonElement])
}
