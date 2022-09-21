//
//  PokemonResponce.swift
//  Otsimo_Task
//
//  Created by Zeynep Baştuğ on 17.09.2022.
//

import Foundation

struct PokemonResponse : Codable {
    
    private(set) var next:String!
    private(set) var results:[PokemonElement]!
}

struct PokemonElement : Codable {
    
    private(set) var url : String!
    private(set) var name : String!
    
}

struct PokemonInfoResponse:Codable {
    
    private(set) var stats: [PokemonStatsElements]!
    private(set) var name:String!
    private(set) var sprites:PokemonSprites!
}


struct PokemonSprites:Codable {
    
    private(set) var other:PokemonOther!
}

struct PokemonOther:Codable {
    
    private(set) var home:PokemonHome!
    
}

struct PokemonHome:Codable {
    
    private(set) var front_default:String!
    
}


struct PokemonStatsElements:Codable {
    
    private(set) var base_stat:Int!
    private(set) var stat:StatFields!
}

struct StatFields:Codable {
    
    private(set) var name:String!
    
}
