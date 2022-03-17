//
//  DetaisFavCoordinator.swift
//  DesafioFinal
//
//  Created by Luiz Mendes Silva on 15/03/22.
//

import UIKit

class DetaisFavCoordinator: Coordinator{

    var navigationController: UINavigationController
    var criptModel: Cripto
    
    init(navigationController:UINavigationController, criptoModel: Cripto ){
        self.navigationController = navigationController
        self.criptModel = criptoModel
    }
    func start() {
        let viewController = DetalhesAddViewController()
        viewController.navigationItem.title = criptModel.subTitle
        viewController.viewAddFav.valueLabel.text = criptModel.value
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
