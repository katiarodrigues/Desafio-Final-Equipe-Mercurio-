//
//  TBViewController.swift
//  DesafioFinal
//
//  Created by Katia Cristina Rodrigues on 07/03/22.
//

import UIKit

class TBViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let coinVc = CoinVC()
        let favoriteVC = FavoriteVC()
        
        coinVc.title = "Moedas"
        favoriteVC.title = "Adicionadas"
        
        self.setViewControllers([coinVc,favoriteVC], animated: false)
        
        guard let items = self.tabBar.items else {return}
        
        let images = ["dollarsign.circle.fill", "star.fill"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
      
    }
    
        
    }


class CoinVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

    }
}

class FavoriteVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}



