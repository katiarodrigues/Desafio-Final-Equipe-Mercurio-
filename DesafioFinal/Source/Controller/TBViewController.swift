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
        view.backgroundColor = .black
    

    }
}

class FavoriteVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var myCollectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = .black
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 140, height: 130)
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView?.register(ListaFavViewCell.self, forCellWithReuseIdentifier:"ListaFavViewCell")
        myCollectionView?.register(TableViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:TableViewHeader.identifier)
        myCollectionView?.backgroundColor = UIColor.black
        
        
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
 
        view.addSubview(myCollectionView ?? UICollectionView())
        self.view = view
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return.bitWidth // How many cells to display
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier:ListaFavViewCell.identifier, for: indexPath)
        myCell.backgroundColor = UIColor.AccentColor
        myCell.layer.cornerRadius = 10
        return myCell
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TableViewHeader.identifier, for: indexPath) as! TableViewHeader
        header.configure()
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 70)
    }
}



