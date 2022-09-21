//
//  ViewController.swift
//  Otsimo_Task
//
//  Created by Zeynep Baştuğ on 13.09.2022.
//

import UIKit

class PokemonAppView: UIViewController {

    
    @IBOutlet weak var loadingView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var pokemonImage: UIImageView!

    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var hpValue: UILabel!
    
    @IBOutlet weak var attackValue: UILabel!
    
    @IBOutlet weak var defenseValue: UILabel!
    
    var pokemonController : ControllerProtocol!
    
    var pokemonList : [PokemonElement]!
    
    var cardValues: Card!
    
    var counter = 0

    var switchFlip = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView.layer.cornerRadius = 36;
        firstView.layer.masksToBounds = true;
        
        secondView.layer.cornerRadius = 36;
        secondView.layer.masksToBounds = true;
        
        loadingView.layer.cornerRadius = 36;
        loadingView.layer.masksToBounds = true;
                
        pokemonController = PokemonAppController()
        pokemonController.viewProtocol = self
        
        secondView.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pokemonController.getPokemonList(url:URL(string:"https://pokeapi.co/api/v2/pokemon/")!)
       
    }
        
    @IBAction func firstButton(_ sender: Any) {
            let transitionOptions: UIView.AnimationOptions
            if switchFlip {
                transitionOptions = [.transitionFlipFromRight, .showHideTransitionViews]
            } else {
              
                transitionOptions = [.transitionFlipFromBottom, .showHideTransitionViews]
            }
        switchFlip = !switchFlip
            
        UIView.transition(with: firstView, duration: 1.0, options: transitionOptions, animations: {
            self.firstView.isHidden = false
        })
            
        UIView.transition(with: firstView, duration: 1.0, options: transitionOptions, animations: {
                self.firstView.isHidden = false
            })
        
        UIView.transition(with: secondView, duration: 1.0, options: transitionOptions, animations: {
            self.secondView.isHidden = true})
        counter+=1
        DispatchQueue.main.async {
            if (self.counter < 20) {
            self.pokemonController.getPokemonInfo(url: URL(string: self.pokemonList[self.counter].url)!)
            } else {
                self.pokemonController.getPokemonList(url: URL(string: self.pokemonController.next)!)
                self.counter = 0
            }
        }
        
    }
    

    @IBAction func restartButton(_ sender: Any) {
        self.counter = 0
        self.pokemonController.getPokemonList(url:URL(string:"https://pokeapi.co/api/v2/pokemon/")!)
    }
    

    
    func isLoading() {
  
     let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
     
     UIView.transition(with: loadingView, duration: 1.0, options: transitionOptions, animations: {
         self.loadingView.isHidden = false
     })
     
     UIView.transition(with: firstView, duration: 1.0, options: transitionOptions, animations: {
         self.firstView.isHidden = true
     })
      
   }
}
extension PokemonAppView : ViewProtocol {
    
    func setPokemonList(list: [PokemonElement]) {
        pokemonList = list
        pokemonController.getPokemonInfo(url:URL(string: pokemonList[0].url)!)
    }
    
    func setCardValues(card:Card){
        cardValues = card
        DispatchQueue.main.async {
            self.pokemonName.text = self.cardValues.getPokemonName()
            self.hpValue.text = String(self.cardValues.getHpValue())
            self.attackValue.text = String(self.cardValues.getAttackValue())
            self.defenseValue.text = String(self.cardValues.getDefenseValue())
            self.pokemonImage.image = self.cardValues.getPokemonImage()
        }
    }
    
    
    
    
}




