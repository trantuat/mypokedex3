//
//  PokemonDetailVC.swift
//  MyPokedex
//
//  Created by Tran Tuat on 2/15/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import UIKit


class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var descriptionLbl:UILabel!
    @IBOutlet weak var typeLbl:UILabel!
    @IBOutlet weak var defenseLbl:UILabel!
    @IBOutlet weak var weighLbl:UILabel!
    @IBOutlet weak var pokedexLbl:UILabel!
    @IBOutlet weak var heighLbl:UILabel!
    @IBOutlet weak var attackLab:UILabel!
    @IBOutlet weak var evoLbl:UILabel!
    
    @IBOutlet weak var mainImg:UIImageView!
    @IBOutlet weak var currentEvoImg:UIImageView!
    @IBOutlet weak var nextEvoImg:UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        pokedexLbl.text = "\(pokemon.pokedexId)"
        pokemon.dowloadPokemon {
            self.updateUI()
            
        }
    }
    
    func updateUI() {
        
        attackLab.text = pokemon.attack
        weighLbl.text = pokemon.weigh
        heighLbl.text = pokemon.weigh
        defenseLbl.text = pokemon.defense
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPress(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
