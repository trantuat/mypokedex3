//
//  Pokemon.swift
//  MyPokedex
//
//  Created by Tran Tuat on 2/14/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name:String!
    private var _pokedexId:Int!
    
    private var _description:String!
    private var _type:String!
    private var _defense:String!
    private var _weigh:String!
    private var _heigh:String!
    private var _attack:String!
    private var _nextEvolutiontxt:String!
    private var _pokemonUrl:String!
    
    var weigh:String {
        if _weigh == nil {
            _weigh = ""
        }
        return _weigh
    }
    var attack:String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var description:String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    var type:String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    var defense:String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    var pokemonUrl:String {
        if _pokemonUrl == nil {
            _pokemonUrl = ""
        }
        return _pokemonUrl
    }
    
    
    var nextEvolutionTxt:String {
        if _nextEvolutiontxt == nil {
            _nextEvolutiontxt = ""
        }
        return _nextEvolutiontxt
    }
    
    var name: String {
        return _name
    }
    
    var pokedexId:Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId:Int) {
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonUrl = "\(BASE_URL)\(URL_POKEMON)\(self.pokedexId)"
    }
    
    func dowloadPokemon(completed: @escaping DownloadCompleted)  {
        
        Alamofire.request(_pokemonUrl).responseJSON { (response) in

            if let dict = response.result.value as? Dictionary<String,AnyObject>{
                
                if let weight = dict["weight"] as? String{
                    self._weigh = weight
                }
                if let height = dict["height"] as? String{
                    self._heigh = height
                }
                if let attack = dict["attack"] as? Int{
                    self._attack = "\(attack)"
                }
                if let defense = dict["defense"] as? Int{
                    self._defense = "\(defense)"
                }
                if let types = dict["types"] as? [Dictionary<String,AnyObject>]{
                    if let name = types[0]["name"] {
                        self._type = name.capitalized!
                    }
                    if types.count > 1 {
                        for i in 0 ..< types.count {
                            if let name = types[i]["name"] {
                                self._type! += "/\(name.capitalized!)"
                            }
                        }
                    }
                }else {
                    self._type = ""
                }
                
                if let descrArr = dict["descriptions"] as? [Dictionary<String,String>], descrArr.count > 0{
                    if let url = descrArr[0]["resource_uri"]{
                        let descriptionUri = "\(BASE_URL)\(url)"
                        Alamofire.request(descriptionUri).responseJSON(completionHandler: { (response) in
                            if let decrpDict = response.result.value as? Dictionary<String,AnyObject> {
                                if let dis = decrpDict["description"] as? String {
                                    self._description = dis
                                    completed()
                                }
                            }
                        })
                        
                    }
                }
       
                
            }
            
            
        }
        
        
    }
}
