//
//  Card.swift
//  Otsimo_Task
//
//  Created by Zeynep Baştuğ on 17.09.2022.
//

import Foundation
import UIKit


class Card {
    
    private var pokemonImage: UIImage!
    
    private var pokemonName: String!
    
    private var hpValue: Int!
    
    private var attackValue: Int!
    
    private var defenseValue: Int!
    
    
    func getPokemonImage () -> UIImage {
        return self.pokemonImage
    }
    
    func setPokemonImage (param: UIImage!) {
         self.pokemonImage = param
    }
    
    
    func getPokemonName () -> String {
        return self.pokemonName
    }
    
    func setPokemonName (param:String){
        self.pokemonName = param
    }

    func getHpValue () -> Int {
        return self.hpValue
    }
    
    func setHpValue (param: Int) {
        self.hpValue = param
    }


    func getAttackValue () -> Int {
        return self.attackValue
    }
    
    func setAttackValue (param: Int) {
        self.attackValue = param
    }

    
    func getDefenseValue () -> Int {
        return self.defenseValue
    }
    
    func setDefenseValue (param: Int) {
        self.defenseValue = param
    }
    
}
