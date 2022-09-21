//
//  PokemonRepository.swift
//  Otsimo_Task
//
//  Created by Zeynep Baştuğ on 17.09.2022.
//

import Foundation
import UIKit

class PokemonAppController: ControllerProtocol {
    
    var viewProtocol:ViewProtocol!
    
    var isDataLoading:Bool!
        
    var cache = NSCache<AnyObject, AnyObject>()
    
    var next:String!
    
    func getPokemonList(url:URL){
        viewProtocol.loadingView.isHidden = false
        viewProtocol.firstView.isHidden = true
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let data  = data {
                    do{
                        let res = try JSONDecoder().decode(PokemonResponse.self,from: data)
                        self.viewProtocol.setPokemonList(list: res.results)
                        self.next = res.next
                        self.viewProtocol.loadingView.isHidden = true
                        self.viewProtocol.firstView.isHidden = false
                        
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            
        
            
        }
        task.resume()
    }
    
    
    func getPokemonInfo(url:URL){
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let data = data {
                    do{
                        let cevap = try JSONDecoder().decode(PokemonInfoResponse.self,from: data)
                        
                        let card:Card = Card()
                        card.setHpValue(param:cevap.stats[0].base_stat)
                        card.setAttackValue(param:cevap.stats[1].base_stat)
                        card.setDefenseValue(param:cevap.stats[2].base_stat)
                        card.setPokemonName(param:cevap.name)
                        self.imageForUrl(urlString: cevap.sprites.other.home.front_default ,
                                         completionHandler: { (im, url) in
                            if im != nil {
                               card.setPokemonImage(param: im)
                            }
                            self.viewProtocol.setCardValues(card: card)
                            self.viewProtocol.loadingView.isHidden=true
                        })
                        
                    }catch{
                        print(error.localizedDescription)
                    }
                }
        }
        task.resume()
    }
    
    
    func imageForUrl(urlString: String, completionHandler:@escaping (_ image: UIImage?, _ url: String) -> ()) {
        let data: NSData? = self.cache.object(forKey: urlString as AnyObject) as? NSData

        if let imageData = data {
            let image = UIImage(data: imageData as Data)
            DispatchQueue.main.async {
                completionHandler(image, urlString)
            }
            return
        }

        let downloadTask: URLSessionDataTask = URLSession.shared.dataTask(with: URL.init(string: urlString)!) { (data, response, error) in
            if error == nil {
                if data != nil {
                    let image = UIImage.init(data: data!)
                    self.cache.setObject(data! as AnyObject, forKey: urlString as AnyObject)
                    DispatchQueue.main.async {
                        completionHandler(image, urlString)
                    }
                }
            } else {
                completionHandler(nil, urlString)
            }
        }
        downloadTask.resume()
    }
    
    

    
    
}
