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
    //MARK: View
    
    let coinV: CoinV = {
        let view = CoinV(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    
    }()
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setCoinV()
    }
    func setCoinV(){
        self.view.addSubview(coinV)
        coinV.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        coinV.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        coinV.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        coinV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

class FavoriteVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}



