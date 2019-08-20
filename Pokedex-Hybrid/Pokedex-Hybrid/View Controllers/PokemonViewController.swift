//
//  PokemonViewController.swift
//  Pokedex-Hybrid
//
//  Created by Apps on 8/20/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, UISearchBarDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    // MARK: - Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text?.lowercased(), !searchTerm.isEmpty else { return }
        
        CMSPokemonController.fetchPokemon(withSearchTerm: searchTerm) { (pokemon) in
            guard let pokemon = pokemon else { return }
            DispatchQueue.main.async {
                self.nameLabel.text = pokemon.name
                self.idLabel.text = "\(pokemon.identifier)"
                self.abilitiesLabel.text = "\(pokemon.abilities.joined(separator: ", "))"
            }
        }
    }
}
