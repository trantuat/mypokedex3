//
//  PokeCell.swift
//  MyPokedex
//
//  Created by Tran Tuat on 2/14/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5.0
    }
    
    var pokemon:Pokemon!
    
    func configureCell(_ pokemon : Pokemon){
        self.pokemon = pokemon
        nameLbl.text = self.pokemon.name.capitalized
        thumbImg.image =  UIImage(named: "\(self.pokemon.pokedexId)")
    }
    
    
}
