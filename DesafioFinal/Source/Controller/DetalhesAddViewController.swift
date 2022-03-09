//
//  DetalhesAddViewController.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 09/03/22.
//

import UIKit

class DetalhesAddViewController: UIViewController {

    let viewAddFav: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let viewAmountTime: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAddFav.backgroundColor =
        setViewAddFav()
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        //esconder navigation bar
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//        //mudar cor da Status bar
//        setNeedsStatusBarAppearanceUpdate()
//    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    func setViewAddFav(){
        self.view.addSubview(viewAddFav)
        viewAddFav.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        viewAddFav.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        viewAddFav.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        viewAddFav.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}
