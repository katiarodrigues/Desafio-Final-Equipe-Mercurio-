//
//  DetalhesAddViewController.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 09/03/22.
//

import UIKit

class DetalhesAddViewController: UIViewController {

    let viewAddFav: AddFavView = {
        let view = AddFavView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let viewAmountByDate: AmountByDateView = {
        let view = AmountByDateView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAddFav.backgroundColor = .greenBackgroundColor
        viewAmountByDate.backgroundColor = .red
        setViewAddFav()
        setViewAmountByDate()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //mostrar navigation bar
        navigationController?.setNavigationBarHidden(false, animated: animated)
        //mudar cor da Status bar
    }
    func setViewAddFav(){
        self.view.addSubview(viewAddFav)
        viewAddFav.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewAddFav.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        viewAddFav.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        viewAddFav.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400).isActive = true
    }
    func setViewAmountByDate(){
        self.view.addSubview(viewAmountByDate)
        viewAmountByDate.topAnchor.constraint(equalTo: viewAddFav.bottomAnchor).isActive = true
        viewAmountByDate.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        viewAmountByDate.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        viewAmountByDate.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


